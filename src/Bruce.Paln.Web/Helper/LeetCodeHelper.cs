using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace Bruce.Paln.Web.Helper
{
    public class LeetCodeHelper
    {
        public string GetAllQuestion()
        {
            try
            {
                string path = Directory.GetCurrentDirectory() + "\\StaticData\\LeetCodeList.json";
                string questations = "";
                using (StreamReader reader = new StreamReader(path, Encoding.UTF8))
                {
                    questations = reader.ReadToEnd();
                }
                return questations;
            }
            catch
            {
                return "";
            }
        }
    }
}