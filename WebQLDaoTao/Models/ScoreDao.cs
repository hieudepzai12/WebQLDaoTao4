using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
	public class ScoreDao
	{
        public SqlConnection Connect()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLDaoTao_ConStr"].ConnectionString);
            return conn;
        }
        public SqlCommand cmd;
        public List<Score> GetByMaMH(string mamh)
        {
            List<Score> lstKQ = new List<Score>();
            var conn = Connect();
            conn.Open();
            cmd = new SqlCommand("select KetQua.*, HoTenSV = HOSV + ' ' + TENSV" +
                " from KetQua inner join SinhVien on KetQua.MASV = SinhVien.MASV" +
                " where MAMH = @mamh", conn);
            cmd.Parameters.AddWithValue("@mamh", mamh);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Score kq = new Score
                {
                    ID = int.Parse(dr["id"].ToString()),
                    MaSV = dr["masv"].ToString(),
                    MaMH = dr["mamh"].ToString(),
                    Diem = string.IsNullOrEmpty(dr["diem"].ToString()) ? 0 : float.Parse(dr["diem"].ToString()),
                    HoTenSV = dr["hotensv"].ToString()
                };
                lstKQ.Add(kq);
            }
            return lstKQ;
        }
        public int Update(int id, float diem)
        {
            var conn = Connect();
            conn.Open();
            cmd = new SqlCommand("update KetQua set diem = @diem where id = @id", conn);
            cmd.Parameters.AddWithValue("@diem", diem);
            cmd.Parameters.AddWithValue("@id", id);
            return cmd.ExecuteNonQuery();
        }
        public int Delete(int id)
        {
            var conn = Connect();
            conn.Open();
            cmd = new SqlCommand("delete from KetQua where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            return cmd.ExecuteNonQuery();
        }
    }
}