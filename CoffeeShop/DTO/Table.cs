using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoffeeShop.DTO
{
    public class Table
    {
        public Table(int id, string name, string status)
        {
            ID = id;
            Name = name;
            Status = status;
        }

        public Table(DataRow row)
        {
            ID = (int)row["Id"];
            Name = row["Name"].ToString();
            Status = row["Status"].ToString();
        }

        public int ID { get; set; }
        public string Name { get; set; }
        public string Status { get; set; }
    }
}
