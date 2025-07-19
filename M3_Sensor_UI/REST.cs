using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace M3_Sensor_UI
{
    public class REST
    {
        HttpWebResponse response;
        HttpWebRequest request;
        string url, res, ipaddress;

        public REST(string urlstr)
        {
            url = urlstr;
        }

        public string RESTdata()
        {
            request = (HttpWebRequest)WebRequest.Create(url);
            response = (HttpWebResponse)request.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream());
            res = reader.ReadToEnd();   
            return res;
        }
        public string RESTip()
        {
            ipaddress = "localhost";
            return ipaddress;
        }
    }
}