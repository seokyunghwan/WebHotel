package com.kajastay.svlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kajastayDAO.KajastayDAO;
import kajastayVO.CpInfo1VO;
import kajastayVO.CpInfo2VO;
import kajastayVO.CpnameVO;
import kajastayVO.MemVo;
import kajastayVO.bkVO;

@WebServlet("*.do")
public class KajaStay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public KajaStay() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		KajastayDAO kjdao = null;
		String uri = request.getRequestURI().substring(request.getContextPath().length());
		String str = null;
		if (uri.contains("/kajaLogin.do")) {
			try {
				kjdao = new KajastayDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			String eid = request.getParameter("eid");
			String epw = request.getParameter("epw");
			MemVo user = kjdao.login_mem(eid, epw);
			if (user != null) {
				if(user.getType().equals("사장")) {
					String imsi = user.getId();
					String name = kjdao.search_cpname(imsi);
					if(name != null) {
						request.setAttribute("cp_name", name);
					}
				}
				request.setAttribute("login1", user);
				str = "sessionset.jsp";
			}
			str = "sessionset.jsp";
		} else if (uri.contains("/myInfo.do")) {
			try {
				kjdao = new KajastayDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			String id = request.getParameter("id");
			String pw = request.getParameter("in_pw1");
			String memname = request.getParameter("in_name");
			String email = request.getParameter("in_email");
			String tel = request.getParameter("in_tel");
			boolean tmp = kjdao.update_mem(pw, memname, email, tel, id);
			if(tmp) {
				MemVo user = kjdao.login_mem(id, pw);
				if (user != null) {
					if(user.getType().equals("사장")) {
						String imsi = user.getId();
						String name = kjdao.search_cpname(imsi);
						if(name != null) {
							request.setAttribute("cp_name", name);
						}
					}
					request.setAttribute("login1", user);
					request.setAttribute("tmp", "Ok");
					str = "../loginPage/sessionset.jsp";
				}
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('계정 업데이트 실패!');location.href='../MainPage/mainFrame.jsp';</script>");
				out.close();
			}
			
		} else if (uri.contains("/insertmem.do")) {
			try {
				kjdao = new KajastayDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			String eid = request.getParameter("eid");
			String epw = request.getParameter("epw");
			String name1 = request.getParameter("name1");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String type = request.getParameter("type");
			boolean tmp = kjdao.insert_mem(eid, epw, name1, email, tel, type);
			if (tmp) {
				MemVo user = new MemVo(eid, epw, name1, email, tel, type);
				request.setAttribute("login1", user);
				str = "JoinSuccess.jsp";
			} else {
				str = "JoinSuccess.jsp";
			}
		} else if (uri.contains("/review.do")) {
			try {
				kjdao = new KajastayDAO();
				int bkcode = Integer.parseInt(request.getParameter("bkcode"));
				String name = request.getParameter("name");
				String id = request.getParameter("id");
				String rmtype = request.getParameter("rmtype");
				int grade = Integer.parseInt(request.getParameter("grade"));
				String revuwe_str = request.getParameter("revuwe_str");
				boolean tmp = kjdao.insert_reviwe(bkcode, name, id, rmtype, grade, revuwe_str);
				if (tmp) {
					boolean tmp2 = kjdao.update_flag(bkcode);
					if (tmp2) {
						str = "../myPage/MyFrame.jsp?mymenu=1";
					}else {
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>alert('플래그 업데이트 실패!');location.href='../MainPage/mainFrame.jsp';</script>");
						out.close();
					}
				} else {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('리뷰작성실패!');location.href='../MainPage/mainFrame.jsp';</script>");
					out.close();
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		} else if (uri.contains("/forgotPW.do")) {
			try {
				kjdao = new KajastayDAO();
				String id = request.getParameter("eid");
				String em = request.getParameter("email");
				boolean tmp = kjdao.search_id(id, em);
				if (tmp) {
					request.setAttribute("id", id);
					str = "PwFind2.jsp";
				} else {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('일치하는 계정이 없습니다.');location.href='PwFind1.jsp';</script>");
					out.close();
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		} else if (uri.contains("/select_bk.do")) {
			try {
				kjdao = new KajastayDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			String id = request.getParameter("id");
			ArrayList<bkVO> bkarr = kjdao.search_bk(id);
			if(bkarr != null) {
				request.setAttribute("bkarr", bkarr);
				str = "../myPage/MyFrame.jsp?mymenu=2";
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('불러오기실패...');location.href='../MainPage/mainFrame.jsp';</script>");
				out.close();
			}
		} else if (uri.contains("/insert_booking.do")) {
			try {
				kjdao = new KajastayDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String romnum = request.getParameter("romnum");
			String in_date = request.getParameter("in_date");
			in_date = in_date.replaceAll("-", "");
			String out_date = request.getParameter("out_date");
			out_date = out_date.replaceAll("-", "");
			String price = request.getParameter("price");
			boolean tmp = kjdao.insert_bk(name, id, romnum, in_date, out_date, price);
			if(tmp) {
				str = "../MainPage/mainFrame.jsp";
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('예약 실패...');location.href='register.jsp';</script>");
				out.close();
			}
		} else if (uri.contains("/insert_cp.do")) {
			try {
				kjdao = new KajastayDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String cptype = request.getParameter("cptype");
			String cp_address = request.getParameter("cp_address");
			String cp_detail = request.getParameter("cp_detail");
			String cp_detail2 = request.getParameter("cp_detail2");
			String first_img = request.getParameter("first_img");
			boolean tmp = kjdao.insert_company(name, id, cptype, cp_address, cp_detail, cp_detail2, first_img);
			if (tmp) {
				str = "#1";
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('업소등록 실패...');location.href='register.jsp';</script>");
				out.close();
			}
		} else if (uri.contains("/repw.do")) {
			try {
				kjdao = new KajastayDAO();
				String pw = request.getParameter("npw1");
				String id = request.getParameter("id1");
				boolean tmp = kjdao.update_mem2(pw, id);
				if(tmp) {
					request.setAttribute("test", pw);
				}
				str = "PwFind3.jsp";
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		 } else if (uri.contains("/rm_click.do")) {
				try {
					kjdao = new KajastayDAO();
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
					String name = request.getParameter("name");
					System.out.println(name);
					CpInfo1VO info1 = kjdao.cp_info1(name);
					if(info1 != null) {
						ArrayList<CpInfo2VO> info2 = kjdao.cp_info2(name);
						if(info2 != null) {
							request.setAttribute("roomInfo", info1);
							request.setAttribute("roomsList", info2);
							str = "../productPage/ProductFrame.jsp";
						}
					}else {
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>alert('오류부분...KajaStay.java-[Line:170]');location.href='../MainPage/mainFrame.jsp';</script>");
						out.close();
					}
		 } else if (uri.contains("/listsortdown.do")) {
			 try {
				 kjdao = new KajastayDAO();
				 request.setAttribute("RoomType1", request.getParameter("RoomType1"));
				 request.setAttribute("RoomType2", request.getParameter("RoomType2"));
				 request.setAttribute("RoomType3", request.getParameter("RoomType3"));
				 request.setAttribute("RoomType4", request.getParameter("RoomType4"));
				 request.setAttribute("RoomType5", request.getParameter("RoomType5"));
				 request.setAttribute("RoomType6", request.getParameter("RoomType6"));
				 ArrayList<CpnameVO> roomList1 = kjdao.search_down(request.getParameter("searchbox"));
				 request.setAttribute("roomList1", roomList1);
			 } catch (ClassNotFoundException | SQLException e) {
				 e.printStackTrace();
			 }
			 str = "../searchPage/SearchFrame.jsp";
		 } else if (uri.contains("/listsortup.do")) {
			 try {
				 kjdao = new KajastayDAO();
				 request.setAttribute("RoomType1", request.getParameter("RoomType1"));
				 request.setAttribute("RoomType2", request.getParameter("RoomType2"));
				 request.setAttribute("RoomType3", request.getParameter("RoomType3"));
				 request.setAttribute("RoomType4", request.getParameter("RoomType4"));
				 request.setAttribute("RoomType5", request.getParameter("RoomType5"));
				 request.setAttribute("RoomType6", request.getParameter("RoomType6"));
				 ArrayList<CpnameVO> roomList1 = kjdao.search_up(request.getParameter("searchbox"));
				 request.setAttribute("roomList1", roomList1);
			 } catch (ClassNotFoundException | SQLException e) {
				 e.printStackTrace();
			 }
			 str = "../searchPage/SearchFrame.jsp";
		} else if (uri.contains("/sear.do")) {
			try {
				kjdao = new KajastayDAO();
				ArrayList<CpnameVO> roomList1 = kjdao.search_cp_name(request.getParameter("searchbox"));
				request.setAttribute("roomList1", roomList1);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			str = "../searchPage/SearchFrame.jsp";
		}else if (uri.contains("/UploadImg.do")) {      //상세등록
        try {
           kjdao = new KajastayDAO();
        } catch (ClassNotFoundException | SQLException e) {
           e.printStackTrace();
        }
           ServletContext context = getServletContext();
           String saveDir = context.getRealPath("roomImg");
           MultipartRequest multi = new MultipartRequest(request, saveDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
           
           String upsoName = multi.getParameter("upso_name");      // 업소명
           String upsoImg = multi.getFilesystemName("upsoImg");      // 업소 이미지 파일명.확장자
           String address = multi.getParameter("address");         // 큰 주소 ex)서울특별시, 인천광역시..
           String address2 = multi.getParameter("address2");      // 작은 주소 ex)관악구, 강동구..
           String location = multi.getParameter("location");      // 세부 주소 ex)신림동 111-22
           String info1 = multi.getParameter("info1");            // 내부시설
           String info2 = multi.getParameter("info2");            // 주변정보
           String id = multi.getParameter("mvoid");
           String cptype = multi.getParameter("upsoJong");
           String tmpstr = address + " " + address2 + " " + location;
           String[] romnum = multi.getParameterValues("romnum");
           String[] romtype = multi.getParameterValues("romtype");
           String[] imgname2 = multi.getParameterValues("imgname");
           String[] imgname = imgname2[0].split(",");
           String[] price1 = multi.getParameterValues("price1");
           String[] price2 = multi.getParameterValues("price2");
           boolean tmp = kjdao.insert_company(upsoName, id, cptype, tmpstr, info1, info2, upsoImg);
           if (tmp) {
        	   for(int i =0; i<romnum.length;i++) {
					boolean tmp2 = kjdao.insert_room(upsoName, romnum[i], romtype[i], imgname[i], Integer.parseInt(price1[i]), Integer.parseInt(price2[i]));
					if(!tmp2) {
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>alert('방정보등록 실패 성공카운트 = " + (i+1) + "');location.href='../MainPage/mainFrame.jsp';</script>");
						out.close();
						break;
					}
				}
              str = "../MainPage/mainFrame.jsp";
           } else {
              response.setContentType("text/html; charset=UTF-8");
              PrintWriter out = response.getWriter();
              out.println("<script>alert('업소등록 실패...');location.href='register.jsp';</script>");
              out.close();
           }
		}
		RequestDispatcher rd = request.getRequestDispatcher(str);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
