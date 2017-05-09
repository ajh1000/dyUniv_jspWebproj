package simpleBean;

import java.sql.*;
import java.util.*;

public class MemberMgr {

    private DBConnectionMgr pool = null;

    public MemberMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }

    public boolean checkId(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean checkCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select ID from member where ID = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            checkCon = rs.next();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return checkCon;
    }

 /*   public Vector zipcodeRead(String area3) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        try {
            con = pool.getConnection();
            String strQuery = "select * from zipcode where area3 like '" + area3 + "%'";
            pstmt = con.prepareStatement(strQuery);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ZipcodeBean tempZipcode = new ZipcodeBean();
                tempZipcode.setZipcode(rs.getString("zipcode"));
                tempZipcode.setArea1(rs.getString("area1"));
                tempZipcode.setArea2(rs.getString("area2"));
                tempZipcode.setArea3(rs.getString("area3"));
                tempZipcode.setArea4(rs.getString("area4"));
                vecList.addElement(tempZipcode);
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vecList;
    }*/

    public boolean memberInsert(RegisterBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into member values(?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getID());
            pstmt.setString(2, regBean.getPW());
            pstmt.setString(3, regBean.getNAME());
            pstmt.setString(4, regBean.getTEL());
            pstmt.setString(5, regBean.getEMAIL());
            pstmt.setString(6, regBean.getLOC());
            pstmt.setString(7, "0"/* admin auth*/);
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }

    public RegisterBean getMember(String mem_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RegisterBean regBean = null;
        
        try {
            con = pool.getConnection();
            String strQuery = "select * from member where ID=?";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                regBean = new RegisterBean();
                regBean.setID(rs.getString("ID"));
                regBean.setPW(rs.getString("PW"));
                regBean.setNAME(rs.getString("NAME"));
                regBean.setTEL(rs.getString("TEL"));
                regBean.setEMAIL(rs.getString("EMAIL"));
                regBean.setLOC(rs.getString("LOC"));
                regBean.setADMIN(rs.getString("ADMIN"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return regBean;
    }

    public Vector getMemberList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * from member";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                RegisterBean regBean = new RegisterBean();
                regBean.setID(rs.getString("ID"));
                regBean.setPW(rs.getString("PW"));
                regBean.setNAME(rs.getString("NAME"));
                regBean.setTEL(rs.getString("TEL"));
                regBean.setEMAIL(rs.getString("EMAIL"));
                regBean.setLOC(rs.getString("LOC"));
                regBean.setADMIN(rs.getString("ADMIN"));
                vecList.add(regBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }

    public boolean memberUpdate(RegisterBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "update member set PW=?, NAME=?,";
            strQuery = strQuery + " EMAIL=?, TEL=?, LOC=?";
            strQuery = strQuery + " where ID=? ";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getPW());
            pstmt.setString(2, regBean.getNAME());
            pstmt.setString(3, regBean.getEMAIL());
            pstmt.setString(4, regBean.getTEL());
            pstmt.setString(5, regBean.getLOC());
            pstmt.setString(6, regBean.getID());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    

    public boolean loginCheck(String id, String passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select id, passwd from member where id = ? and passwd = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }
    public boolean memberRemove(String id)
    {
    	//DELETE FROM `gameshop`.`member` WHERE `ID`='c';
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "DELETE FROM gameshop.member WHERE ID=?";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }

    public boolean adminCheck(String admin_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select ID, ADMIN from member where ID = ? and ADMIN = 1";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, admin_id);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }
}
