package simpleBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class OrderMgr {
	private DBConnectionMgr pool = null;

	public OrderMgr()
	{
		try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
	}
	
	public boolean insertOrder(OrderBean order) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        ResultSet rs=null;
        int num=0;
        
        try {
            con = pool.getConnection();
           	String strQuery = "select * from itemorder";

            pstmt = con.prepareStatement(strQuery);
            rs = pstmt.executeQuery();
            rs.last();
        	num=rs.getRow();
        	num++;

            
            strQuery = "INSERT INTO `gameshop`.`itemorder` "
            		+ "(`num`, `ID`, `name`, `quantity`, `buyerName`) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, Integer.toString(num));
            pstmt.setString(2, order.getID());
            pstmt.setString(3, order.getName());
            pstmt.setString(4, order.getQuantity());
            pstmt.setString(5, order.getBuyerName());
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
	
	public Vector getOrderList(String ID)
	{
		Vector list=new Vector();
		OrderBean orderBean=null;
		Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        
        try {
            con = pool.getConnection();
           	String strQuery = "select * from itemorder where ID = ?";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, ID);
            rs = pstmt.executeQuery();
            while(rs.next())
            {
            	orderBean=new OrderBean();
            	orderBean.setID(ID);
            	orderBean.setBuyerName(rs.getString("buyerName"));
            	orderBean.setName(rs.getString("name"));
            	orderBean.setQuantity(rs.getString("quantity"));
            	
            	list.add(orderBean);
            }
        }catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        
		return list;
		
	}
}
