using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Security.Policy;
using System.Text.Json;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace M3_Sensor_UI
{
    public partial class LogPage : System.Web.UI.Page
    {
        string ip, url, res,month,day,yr,date,alarmvalue,modevalue,modedsp,alarmdsp;
        string[] dateformat;
        REST retrieve, getIP,search;

        protected void Page_Load(object sender, EventArgs e)
        {
            getIP = new REST(url = "");
            ip = getIP.RESTip();
 

            url = "http://" + ip + "/lightsensor/REST/insertData.php";
            retrieve = new REST(url);
            res = retrieve.RESTdata();
            createGrid(res);
        }

        protected void btnfilter_Click(object sender, EventArgs e)
        {
            btnlive.Text = "Live";
            timerlog.Enabled = false;
            
            alarmvalue = falarmlist.SelectedValue.ToString();
            modevalue = fmodelist.SelectedValue.ToString();
            date = fdatetxt.Text;
            if(date == "" && alarmvalue == "All" && modevalue == "All") {
                btnlive.Enabled = true;
                btnlive.BackColor = System.Drawing.Color.DeepPink;
            }
            else
            {
                btnlive.Enabled = false;
                btnlive.BackColor = System.Drawing.Color.Gray;
            }
            if (date != "")
            {
                dateformat = date.Split('-');
                month = dateformat[1];
                day = dateformat[2];
                yr = dateformat[0];
                alarmvalue = falarmlist.SelectedValue.ToString();


                url = "http://" + ip + "/lightsensor/REST/filter.php?month=" + month + "&day=" + day + "&year=" + yr + 
                    "&alarmstate=" + alarmvalue + "&modestate=" + modevalue;
            }
            else
            {
                url = "http://" + ip + "/lightsensor/REST/filter.php?month=null&day=null&year=null&alarmstate=" + alarmvalue + "&modestate=" + modevalue;

            }
           

                search = new REST(url);
            res = search.RESTdata();

            if (res == "no rows")
            {
                GridView1.Visible = false;

            }
            else
            {
                createGrid(res);
            }
        }

        protected void btnlive_Click(object sender, EventArgs e)
        { 
            if (btnlive.Text == "Live")
            {
                btnlive.Text = "Stop Live";
                timerlog.Enabled = true;
            }
            else if (btnlive.Text == "Stop Live")
            {
                btnlive.Text = "Live";
                timerlog.Enabled=false;
            }
        }
        protected void btnreset_Click(object sender, EventArgs e)
        {
            fdatetxt.Text = "";
            fmodelist.SelectedIndex = 0;
            falarmlist.SelectedIndex = 0;
            btnlive.BackColor = System.Drawing.Color.DeepPink;
            btnlive.Enabled = true;
        }
        protected void timerlog_Tick(object sender, EventArgs e)
        {
            url = "http://" + ip + "/lightsensor/REST/insertData.php";
            retrieve = new REST(url);
            res = retrieve.RESTdata();
            createGrid(res);

        }

        public void createGrid(string res)
        {
            GridView1.Visible = true;
            JsonDocument doc = JsonDocument.Parse(res);
            JsonElement root = doc.RootElement;
            int rootcount = root.GetArrayLength();
            DataTable dt = new DataTable();

            if (dt.Columns.Count == 0)
            {
                dt.Columns.Add("Date", typeof(string));
                dt.Columns.Add("Time", typeof(string));
                dt.Columns.Add("Mode", typeof(string));
                dt.Columns.Add("Alarm", typeof(string));
            }

            for (int i = 0; i < rootcount; i++)
            {
                var ul = root[i];
                month = ul.GetProperty("month").ToString();
                day = ul.GetProperty("day").ToString();
                yr = ul.GetProperty("year").ToString();
                date = month + "/" + day + "/" + yr;
   
                if(ul.GetProperty("mode_status").ToString() == "1")
                {
                    modedsp = "Automatic";
                }
                else
                {
                    modedsp = "Manual";
                }

                if (ul.GetProperty("alarm_status").ToString() == "1")
                {
                    alarmdsp = "Alert";
                }
                else
                {
                    alarmdsp = "--";
                }


                DataRow NewRow = dt.NewRow();
              
                NewRow[0] = date;
                NewRow[1] = ul.GetProperty("log_time").ToString();
                NewRow[2] = modedsp;
                NewRow[3] = alarmdsp;
                dt.Rows.Add(NewRow);

            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}