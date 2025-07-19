using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M3_Sensor_UI
{
    public partial class HomePage : System.Web.UI.Page
    {
        string ip, url, res, mode, cmonth, cday, cyear;
        string[] status;
        REST retrieve, insert, getIP;


        protected void Page_Load(object sender, EventArgs e)
        {
            getIP = new REST(url = "");
            ip = getIP.RESTip();
        }
        protected void btnoff_Click(object sender, EventArgs e)
        {
            if (modetxt.Text == "Automatic")
            {
                mode = "1";
            }
            else
            {
                mode = "0";
                url = "http://" + ip + "/lightsensor/REST/setLight.php?pState=0" + "&mState=" + mode +
                       "&mon=null" + "&day=null" + "&yr=null" + "&time=null" + "mode=null";
                insert = new REST(url);
                res = insert.RESTdata();
            }
        }

        protected void btnon_Click(object sender, EventArgs e)
        {
            if (modetxt.Text == "Automatic")
            {
                mode = "1";
            }
            else
            {
                mode = "0";
                url = "http://" + ip + "/lightsensor/REST/setLight.php?pState=1" + "&mState=" + mode +
                      "&mon=" + DateTime.Now.ToString("MM") + "&day=" + DateTime.Now.Day.ToString()
                +"&yr=" + DateTime.Now.ToString("yyyy") + "&time=" + Label8.Text + "&mode=" + mode;
                insert = new REST(url);
                res = insert.RESTdata();
            }
        }

        protected void alarmalert_Tick(object sender, EventArgs e)
        {
            url = "http://" + ip + "/lightsensor/REST/getAlarm.php";
            retrieve = new REST(url);
            res = retrieve.RESTdata();
            if (res == "alarm")
            {
                alarmtxt.Visible = true;

            }
            else
            {
                alarmtxt.Visible = false;
            }
        }

        protected void timerdate_Tick(object sender, EventArgs e)
        {
            Label8.Text = DateTime.Now.ToString("HH:mm:ss");
            //yyyy-mm-dd
        }

        protected void statusswitch_Tick(object sender, EventArgs e)
        {
            url = "http://" + ip + "/lightsensor/REST/getStatus.php";
            retrieve = new REST(url);
            res = retrieve.RESTdata();
            status = res.Split('|');
            modetxt.Text = status[0];
            powertxt.Text = status[1];
        }
        //power = light status
        //mode = auto or manual
        protected void timercount_Tick(object sender, EventArgs e)
        {
            cmonth = DateTime.Now.ToString("MM");
            cday = DateTime.Now.Day.ToString();
            cyear = DateTime.Now.ToString("yyyy");
            url = "http://" + ip + "/lightsensor/REST/getCount.php?month=" + cmonth + "&day=" + cday + "&year=" + cyear;
            retrieve = new REST(url);
            res = retrieve.RESTdata();
            counttxt.Text = res;
        }
       

    }
}