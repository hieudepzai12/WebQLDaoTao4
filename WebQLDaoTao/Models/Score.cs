using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
	public class Score
	{
		public int ID { get; set; }
		public string MaSV { get; set; }
        public string MaMH { get; set; }
		public Double? Diem { get; set; }
        public string HoTenSV { get; set; }
    }
}