package simpleBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class SubmitMgr {
	private DBConnectionMgr pool = null;

    public SubmitMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }
    
    public boolean removeSubmit(String title)
    {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "DELETE FROM gameshop.submit WHERE title=?";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, title);
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
    
    public boolean addSubmit(SubmitBean submit,int isNotice)
    {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        ResultSet rs=null;
        int num=0;
        
        try {
            con = pool.getConnection();
           	String strQuery = "select * from submit";

            pstmt = con.prepareStatement(strQuery);
            rs = pstmt.executeQuery();
            rs.last();
        	num=rs.getRow();
        	num++;

            
            strQuery = "INSERT INTO `gameshop`.`submit` (`num`, `title`, `content`,`isNotice`) VALUES (?,?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, Integer.toString(num));
            pstmt.setString(2, submit.getTitle());
            pstmt.setString(3, submit.getContent());
            pstmt.setString(4, Integer.toString(isNotice));
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
    
    public Vector getSubmitList(int isNotice)
    {
    	Vector list=new Vector();
    	SubmitBean submitBean=null;
		Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        
        try {
            con = pool.getConnection();
           	String strQuery = "select * from submit where isNotice = ?";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, Integer.toString(isNotice));
            rs = pstmt.executeQuery();
            while(rs.next())
            {
            	submitBean=new SubmitBean();
            	submitBean.setTitle(rs.getString("title"));
            	submitBean.setContent(rs.getString("content"));
            	
            	list.add(submitBean);
            }
        }catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        
		return list;
    }
}
