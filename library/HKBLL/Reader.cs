﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.BLL
{
    public class Reader
    {
        public static List<HK.Model.Reader> Get()
        {
            return HK.DAL.Reader.Get();
        }

        public static HK.Model.Reader Get(int Id)
        {
            return HK.DAL.Reader.Get(Id);
        }

        public static HK.Model.Reader Get(string Name)
        {
            return HK.DAL.Reader.Get(Name);
        }

        public static List<HK.Model.Reader> Rank()
        {
            return HK.DAL.Reader.Rank();
        }

        public static List<HK.Model.Reader> GetByType(int Typeid)
        {
            return HK.DAL.Reader.GetByType(Typeid);
        }

        public static bool Insert(HK.Model.Reader Reader)
        {
            return HK.DAL.Reader.Insert(Reader);
        }

        public static bool Update(HK.Model.Reader Reader)
        {
            return HK.DAL.Reader.Update(Reader);
        }

        public static string Delete(int Id)
        {
            // 检查是否还有未还书
            List<HK.Model.BorrowAndBack> BorrowAndBack = HK.BLL.BorrowAndBack.GetByReaderAndHaveBookNotBack(Id);
            if (BorrowAndBack.Count > 0)
            {
                return "用户有书未还";
            }
            
            if (HK.DAL.Reader.Delete(Id))
            {
                return "删除成功";
            }
            else
            {
                return "执行出错";
            }
        }
    }
}
