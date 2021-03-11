package kajastayDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kajastayConn.KajastayConn;
import kajastayVO.CpInfo1VO;
import kajastayVO.CpInfo2VO;
import kajastayVO.CpnameVO;
import kajastayVO.MemVo;
import kajastayVO.bkVO;

public class KajastayDAO {
   private Connection con;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   public KajastayDAO()
         throws ClassNotFoundException, SQLException{
      con= new KajastayConn().getConnection();
   }
   public void pstmtClose() throws SQLException{
      if(pstmt != null){ pstmt.close(); }
   }

   public void getAllInfoClose() throws SQLException{
      if(rs != null){ rs.close(); }
      if(pstmt != null){ pstmt.close(); }
      if(con != null){ con.close(); }
   }
   public boolean update_mem(String pw, String memname, String email, String tel, String id){
      String sql = "update kaja_stay_member set pw = ?, memname = ?, email = ?,tel = ? where id = ?";
      try{
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, pw);
         pstmt.setString(2, memname);
         pstmt.setString(3, email);
         pstmt.setString(4, tel);
         pstmt.setString(5, id);
         pstmt.executeUpdate();
      }catch(SQLException e){
         e.printStackTrace();
         return false;
      }
      return true;
   }
   public boolean update_mem2(String pw, String id){
      String sql = "update kaja_stay_member set pw = ? where id = ?";
      try{
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, pw);
         pstmt.setString(2, id);
         pstmt.executeUpdate();
      }catch(SQLException e){
         e.printStackTrace();
         return false;
      }
      return true;
   }
   public MemVo login_mem(String id2, String pw2){
      String sql = "select * from kaja_stay_member where id=? and pw=?";
      try{
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, id2);
         pstmt.setString(2, pw2);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            String id = rs.getString("id");
            String pw = rs.getString("pw");
            String memname = rs.getString("memname");
            String email = rs.getString("email");
            String tel = rs.getString("tel");
            String type = rs.getString("type");
            return new MemVo(id, pw, memname, email, tel, type);
         }
      }catch(SQLException e){
         e.printStackTrace();
         return null;
      }
      return null;
   }
   public boolean insert_bk(String name, String id, String romnum, String in_date, String out_date, String price){
	   int price1 = Integer.parseInt(price);
	   String sql = "insert into kaja_stay_booking values((select nvl(MAX(bkcode)+1,100000) from kaja_stay_booking),?,?,?,?,?,?,'NO')";
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, romnum);
			int year1 = Integer.parseInt(in_date.substring(0,4))-1900;
			int month1=Integer.parseInt(in_date.substring(4,6))-1;
			int day1 = Integer.parseInt(in_date.substring(6,8));
			Date d1 = new Date(year1,month1,day1);
			int year2 = Integer.parseInt(in_date.substring(0,4))-1900;
			int month2=Integer.parseInt(in_date.substring(4,6))-1;
			int day2 = Integer.parseInt(in_date.substring(6,8));
			Date d2 = new Date(year2,month2,day2);
			pstmt.setDate(4, d1);
			pstmt.setDate(5, d2);
			pstmt.setInt(6, price1);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
		return true;
   }
   public boolean insert_room(String name, String romnum, String rmtype, String second_img, int rent_pr, int allday_pr){
	   String sql = "insert into kaja_stay_cpdt values(?,?,?,?,?,?)";
	      try{
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, name);
	         pstmt.setString(2, romnum);
	         pstmt.setString(3, rmtype);
	         pstmt.setString(4, second_img);
	         pstmt.setInt(5, rent_pr);
	         pstmt.setInt(6, allday_pr);
	         pstmt.executeUpdate();
	      }catch(SQLException e){
	           return false;
	      }
	      return true;
   }
   public boolean insert_reviwe(int bkcode, String name, String id, String rmtype, int grade, String revuwe_str){
	   String sql = "insert into kaja_stay_reviwe values (?,?,?,?,?,?)";
	      try{
	         pstmt=con.prepareStatement(sql);
	         pstmt.setInt(1, bkcode);
	         pstmt.setString(2, name);
	         pstmt.setString(3, id);
	         pstmt.setString(4, rmtype);
	         pstmt.setInt(5, grade);
	         pstmt.setString(6, revuwe_str);
	         pstmt.executeUpdate();
	      }catch(SQLException e){
	           return false;
	      }
	      return true;
   }
   public boolean update_flag(int bkcode){
	   String sql = "UPDATE kaja_stay_booking SET flag = 'OK' where bkcode = " + bkcode + " and flag = 'NO'";
	   try{
	         pstmt=con.prepareStatement(sql);
	         pstmt.executeUpdate();
	      }catch(SQLException e){
	         e.printStackTrace();
	         return false;
	      }
	      return true;
   }
   public boolean insert_mem(String id, String pw, String memname, String email, String tel, String type){
	   String sql = "insert into kaja_stay_member values(?,?,?,?,?,?)";
	      try{
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setString(2, pw);
	           pstmt.setString(3, memname);
	           pstmt.setString(4, email);
	           pstmt.setString(5, tel);
	           pstmt.setString(6, type);
	           pstmt.executeUpdate();
	      }catch(SQLException e){
	           return false;
	      }
	      return true;
   }
   public boolean insert_company(String name, String id, String cptype, String cp_address, String cp_detail, String cp_detail2, String first_img){
      String imsitel = "0505";
      for(int i = 0; i <2; i++) {
         imsitel += "-";
         for(int o = 0; o<4 ; o++) {
            imsitel += (int)(Math.random() * 10000) % 10;
         }
      }
      String sql = "insert into kaja_stay_cp values (?,?,?,?,?,?,?,?)";
      try{
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, name);
         pstmt.setString(2, id);
         pstmt.setString(3, cptype);
         pstmt.setString(4, cp_address);
         pstmt.setString(5, imsitel);
         pstmt.setString(6, cp_detail);
         pstmt.setString(7, cp_detail2);
         pstmt.setString(8, first_img);
         pstmt.executeUpdate();
      }catch(SQLException e){
         return false;
      }
      return true;
   }
   public ArrayList<bkVO> search_bk(String id){
	   ArrayList<bkVO> arr = new ArrayList<bkVO>();
	   String sql = "select b.bkcode, b.name, m.memname, m.tel, b.romnum, b.in_date, b.out_date, b.price, b.flag, c.second_img from kaja_stay_booking b, kaja_stay_member m, kaja_stay_cpdt c where b.id=m.id and b.romnum=c.romnum and b.name=c.name and b.id = ?";
       try{
          pstmt=con.prepareStatement(sql);
          pstmt.setString(1, id);
          rs = pstmt.executeQuery();
          while(rs.next()) {
        	  int bkcode = rs.getInt("bkcode");
        	  String name = rs.getString("name");
        	  String memname = rs.getString("memname");
        	  String tel = rs.getString("tel");
        	  String romnum = rs.getString("romnum");
        	  Date in_date = rs.getDate("in_date");
        	  Date out_date = rs.getDate("out_date");
        	  String flag = rs.getString("flag");
        	  String second_img = rs.getString("second_img");
        	  int price = rs.getInt("price");
        	  arr.add(new bkVO(bkcode, name, memname, tel, romnum, in_date, out_date, price, flag, second_img));
          }
       }catch(SQLException e){
          e.printStackTrace();
       }
	   return arr;
   }
   public String search_cpname(String name){
	   String sql = "select name from kaja_stay_cp join kaja_stay_member on kaja_stay_member.id = kaja_stay_cp.id where kaja_stay_member.id=?";
       try{
          pstmt=con.prepareStatement(sql);
          pstmt.setString(1, name);
          rs = pstmt.executeQuery();
          if(rs.next()) return rs.getString("name");
       }catch(SQLException e){
          e.printStackTrace();
       }
       return null;
   }
   public boolean search_id(String id, String em){
      boolean flag = false;
         String sql = "SELECT id FROM kaja_stay_member where id=? and email=?";
         try{
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, em);
            rs = pstmt.executeQuery();
            if(rs.next()) flag = true;
            else flag = false;
         }catch(SQLException e){
            e.printStackTrace();
         }
         return flag;
   }
   public CpInfo1VO cp_info1(String name){
	   String sql = "select c1.name, mem.memname, c1.cptype, c1.cp_address, c1.cp_tel, c1.cp_detail, c1.cp_detail2,c1.first_img from kaja_stay_cp c1 join kaja_stay_member mem on c1.id = mem.id where c1.name=?";
	   CpInfo1VO info1 = null;
	   try{
          pstmt=con.prepareStatement(sql);
          pstmt.setString(1, name);
          rs = pstmt.executeQuery();
          if(rs.next()) {
        	  String name1 = rs.getString("name");
        	  String memname = rs.getString("memname");
        	  String cptype = rs.getString("cptype");
        	  String cp_address = rs.getString("cp_address");
        	  String cp_tel = rs.getString("cp_tel");
        	  String cp_detail = rs.getString("cp_detail");
        	  String cp_detail2 = rs.getString("cp_detail2");
        	  String first_img = rs.getString("first_img");
        	  info1 = new CpInfo1VO(name1, memname, cptype, cp_address, cp_tel, cp_detail, cp_detail2, first_img);
          }
          else info1 = null;
       }catch(SQLException e){
          e.printStackTrace();
       }
       return info1;
   }
   public ArrayList<CpInfo2VO> cp_info2(String name){
	   String sql = "select * from kaja_stay_cpdt where name =?";
	   ArrayList<CpInfo2VO> info2 = new ArrayList<CpInfo2VO>();
	   try{
          pstmt=con.prepareStatement(sql);
          pstmt.setString(1, name);
          rs = pstmt.executeQuery();
          while(rs.next()) {
        	  String name1 = rs.getString("name");
        	  String romnum = rs.getString("romnum");
        	  String rmtype = rs.getString("rmtype");
        	  String second_img = rs.getString("second_img");
        	  int rent_pr = rs.getInt("rent_pr");
        	  int allday_pr = rs.getInt("allday_pr");
        	  info2.add(new CpInfo2VO(name1, romnum, rmtype, second_img, rent_pr, allday_pr));
          }
       }catch(SQLException e){
          e.printStackTrace();
       }
       return info2;
   }
   public boolean id_ck(String id){
         boolean flag = false;
         String sql = "SELECT id FROM kaja_stay_member where id=?";
         try{
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()) flag = true;
            else flag = false;
         }catch(SQLException e){
            e.printStackTrace();
         }
         return flag;
   }
   public ArrayList<CpnameVO> search_cp_name(String name){
      ArrayList<CpnameVO> cparray = new ArrayList<CpnameVO>();
      String sql = 
            "select c1.name, c1.id, c1.cptype, c1.cp_address, c1.cp_tel, c1.cp_detail, c1.cp_detail2, c1.first_img , min(c2.rent_pr) rent_pr, min(c2.allday_pr) allday_pr, c2.rmtype, nvl(avg(r1.grade),0) grade " + 
            "from kaja_stay_cp c1, kaja_stay_cpdt c2, kaja_stay_reviwe r1 " + 
            "where c1.name = c2.name and r1.name(+) = c1.name and " + 
            "c2.name like '%" + name + "%' and (c2.name,c2.rent_pr) in(select name,min(rent_pr) from kaja_stay_cpdt group by name) " + 
            "group by c1.name, c1.id, c1.cptype, c1.cp_address, c1.cp_tel, c1.cp_detail, c1.cp_detail2,c1.first_img, c2.rmtype";
      //String sql = "select * from kaja_stay_cp where name like '%" + name + "%'";
      try{
         pstmt=con.prepareStatement(sql);
         rs = pstmt.executeQuery();
         while(rs.next()) {
            String name1 = rs.getString("name");
            String id = rs.getString("id");
            String cptype = rs.getString("cptype");
            String cp_address = rs.getString("cp_address");
            String cp_tel = rs.getString("cp_tel");
            String cp_detail = rs.getString("cp_detail");
            String cp_detail2 = rs.getString("cp_detail2");
            String first_img = rs.getString("first_img");
            int rent_pr = rs.getInt("rent_pr");
            int allday_pr = rs.getInt("allday_pr");
            String rmtype = rs.getString("rmtype");
            double grade = rs.getDouble("grade");
               CpnameVO tv = new CpnameVO(name1, id, cptype, cp_address, cp_tel, cp_detail, cp_detail2, first_img, rent_pr, allday_pr, rmtype, grade);
            cparray.add(tv);
         }
      }catch(SQLException e){
         return null;
      }
      return cparray;
   }
   public ArrayList<CpnameVO> search_up(String name){
	      ArrayList<CpnameVO> cparray = new ArrayList<CpnameVO>();
	      String sql = 
	    		  "select c1.name, c1.id, c1.cptype, c1.cp_address, c1.cp_tel, c1.cp_detail, c1.cp_detail2, c1.first_img , min(c2.rent_pr) rent_pr, min(c2.allday_pr) allday_pr, c2.rmtype, nvl(avg(r1.grade),0) grade " + 
	    				  "from kaja_stay_cp c1, kaja_stay_cpdt c2, kaja_stay_reviwe r1 " + 
	    				  "where c1.name = c2.name and r1.name(+) = c1.name and " + 
	    				  "c2.name like '%" + name + "%' and (c2.name,c2.rent_pr) in(select name,min(rent_pr) from kaja_stay_cpdt group by name) " + 
	    				  "group by c1.name, c1.id, c1.cptype, c1.cp_address, c1.cp_tel, c1.cp_detail, c1.cp_detail2,c1.first_img, c2.rmtype order by 9 desc";
	      //String sql = "select * from kaja_stay_cp where name like '%" + name + "%'";
	      try{
	         pstmt=con.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            String name1 = rs.getString("name");
	            String id = rs.getString("id");
	            String cptype = rs.getString("cptype");
	            String cp_address = rs.getString("cp_address");
	            String cp_tel = rs.getString("cp_tel");
	            String cp_detail = rs.getString("cp_detail");
	            String cp_detail2 = rs.getString("cp_detail2");
	            String first_img = rs.getString("first_img");
	            int rent_pr = rs.getInt("rent_pr");
	            int allday_pr = rs.getInt("allday_pr");
	            String rmtype = rs.getString("rmtype");
	            double grade = rs.getDouble("grade");
	               CpnameVO tv = new CpnameVO(name1, id, cptype, cp_address, cp_tel, cp_detail, cp_detail2, first_img, rent_pr, allday_pr, rmtype, grade);
	            cparray.add(tv);
	         }
	      }catch(SQLException e){
	         return null;
	      }
	      return cparray;
	   }
   public ArrayList<CpnameVO> search_down(String name){
	      ArrayList<CpnameVO> cparray = new ArrayList<CpnameVO>();
	      String sql = 
	    		  "select c1.name, c1.id, c1.cptype, c1.cp_address, c1.cp_tel, c1.cp_detail, c1.cp_detail2, c1.first_img , min(c2.rent_pr) rent_pr, min(c2.allday_pr) allday_pr, c2.rmtype, nvl(avg(r1.grade),0) grade " + 
	    		  "from kaja_stay_cp c1, kaja_stay_cpdt c2, kaja_stay_reviwe r1 " + 
	    		  "where c1.name = c2.name and r1.name(+) = c1.name and " + 
	    		  "c2.name like '%" + name + "%' and (c2.name,c2.rent_pr) in(select name,min(rent_pr) from kaja_stay_cpdt group by name) " + 
	    		  "group by c1.name, c1.id, c1.cptype, c1.cp_address, c1.cp_tel, c1.cp_detail, c1.cp_detail2,c1.first_img, c2.rmtype order by 9 asc";
	      //String sql = "select * from kaja_stay_cp where name like '%" + name + "%'";
	      try{
	         pstmt=con.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            String name1 = rs.getString("name");
	            String id = rs.getString("id");
	            String cptype = rs.getString("cptype");
	            String cp_address = rs.getString("cp_address");
	            String cp_tel = rs.getString("cp_tel");
	            String cp_detail = rs.getString("cp_detail");
	            String cp_detail2 = rs.getString("cp_detail2");
	            String first_img = rs.getString("first_img");
	            int rent_pr = rs.getInt("rent_pr");
	            int allday_pr = rs.getInt("allday_pr");
	            String rmtype = rs.getString("rmtype");
	            double grade = rs.getDouble("grade");
	               CpnameVO tv = new CpnameVO(name1, id, cptype, cp_address, cp_tel, cp_detail, cp_detail2, first_img, rent_pr, allday_pr, rmtype, grade);
	            cparray.add(tv);
	         }
	      }catch(SQLException e){
	         return null;
	      }
	      return cparray;
	   }
}