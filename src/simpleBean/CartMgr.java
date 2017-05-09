package simpleBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class CartMgr {
	private DBConnectionMgr pool = null;

    public CartMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }
    
    public boolean removeCart(String id,String itemName)
    {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "DELETE FROM gameshop.itemcart WHERE name=? and ID=?";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, itemName);
            pstmt.setString(2, id);
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
    
    public boolean addCart(CartBean cart)
    {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        ResultSet rs=null;
        int num=0;
        
        try {
            con = pool.getConnection();
           	String strQuery = "select * from itemcart";

            pstmt = con.prepareStatement(strQuery);
            rs = pstmt.executeQuery();
            rs.last();
        	num=rs.getRow();
        	num++;

            
            strQuery = "INSERT INTO `gameshop`.`itemcart` (`num`, `ID`, `name`) VALUES (?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, Integer.toString(num));
            pstmt.setString(2, cart.getID());
            pstmt.setString(3, cart.getName());
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
    
    public Vector getCartList(String ID)
    {
    	Vector list=new Vector();
    	CartBean cartBean=null;
		Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        
        try {
            con = pool.getConnection();
           	String strQuery = "select * from itemcart where ID = ?";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, ID);
            rs = pstmt.executeQuery();
            while(rs.next())
            {
            	cartBean=new CartBean();
            	cartBean.setID(ID);
            	cartBean.setName(rs.getString("name"));
            	
            	list.add(cartBean);
            }
        }catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        
		return list;
    }
}
