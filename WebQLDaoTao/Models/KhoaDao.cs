﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
    public class KhoaDao
    {
        public SqlConnection Connect()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLDaoTao_ConStr"].ConnectionString);
            return conn;
        }
        public SqlCommand cmd;
        public List<Khoa> GetAll()
        {

            List<Khoa> ds = new List<Khoa>();
            var conn = Connect();
            conn.Open();
            cmd = new SqlCommand("select * from Khoa", conn);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                Khoa kh = new Khoa
                {
                    MaKH = rd["MAKH"].ToString(),
                    TenKH = rd["TENKH"].ToString()
                };
                ds.Add(kh);
            }
            return ds;
        }
        public int Update(string makh, string tenkh)
        {
            var conn = Connect();
            conn.Open();
            cmd = new SqlCommand("update Khoa set tenkh = @tenkh where makh=@makh", conn);
            cmd.Parameters.AddWithValue("@makh", makh);
            cmd.Parameters.AddWithValue("@tenkh", tenkh);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }
        public int Delete(string makh)
        {
            try
            {
                //1.Mo ket noi CSDL
                var conn = Connect();
                conn.Open();
                //2.tao truy van
                cmd = new SqlCommand("delete from Khoa where makh=@makh", conn);
                cmd.Parameters.AddWithValue("@makh", makh);
                //3.thuc thi ket qua;
                return cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                return -1;
            }
        }

        public Khoa findByMaKh(string makh)
        {
            Khoa kq = null;
            //1.Mo ket noi CSDL
            var conn = Connect();
            conn.Open();
            //2.tao truy van
            cmd = new SqlCommand("select * from Khoa where makh=@makh", conn);
            cmd.Parameters.AddWithValue("@makh", makh);
            //3.thuc thi ket qua;
            SqlDataReader rd = cmd.ExecuteReader();
            //4.xu ly ket qua tra ve
            if (rd.Read())
            {
                //tao doi tuong mon hoc
                kq = new Khoa
                {
                    MaKH = rd["MAKH"].ToString(),
                    TenKH = rd["TENKH"].ToString()
                };
            }
            return kq;
        }
        public int Insert(string makh, string tenkh)
        {
            //1.Mo ket noi CSDL
            var conn = Connect();
            conn.Open();
            //2.tao truy van
            cmd = new SqlCommand("insert into Khoa values (@makh,@tenkh)", conn);
            cmd.Parameters.AddWithValue("@makh", makh);
            cmd.Parameters.AddWithValue("@tenkh", tenkh);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }
    }
}