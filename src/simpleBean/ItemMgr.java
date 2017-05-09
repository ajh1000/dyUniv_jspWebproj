package simpleBean;

import java.io.Console;
import java.sql.*;
import java.util.*;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.org.apache.xml.internal.resolver.helpers.Debug;

public class ItemMgr {
	private DBConnectionMgr pool = null;

    public ItemMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }
    
    public String updateQuantity(String name,String quantity)
    {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        boolean flag = false;
        String oldQuantity=null;
        int result=0;
        String state=null;
        
        try {
        	con = pool.getConnection();
        	
        	String strQuery = "select quantity from item where name=?";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, name);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	oldQuantity=rs.getString("quantity");
                
            }
            result=Integer.parseInt(oldQuantity)-Integer.parseInt(quantity);
            if(result <0)
            {
            	state="buyed too many";
            	return state;
            }
            
            strQuery = "update item set quantity = ?  where name = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, Integer.toString(result ));
            pstmt.setString(2, name);
            
            int count = pstmt.executeUpdate();
            if(count >0)
            {
            	state="true";
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return state;
    	
    }

    public boolean insertItem(ItemBean item) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into item values(?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, item.getName());
            pstmt.setString(2, item.getPrice());
            pstmt.setString(3, item.getRelease());
            pstmt.setString(4, item.getMain_category());
            pstmt.setString(5, item.getSub_category());
            pstmt.setString(6, item.getDesc());
            pstmt.setString(7, item.getImgURL());
            pstmt.setString(8, item.getIsDiscount());
            pstmt.setString(9, item.getPercentage());
            pstmt.setString(10, item.getIsHot());
            pstmt.setString(11, item.getQuantity());
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
    public Vector getItemList(String MainOrder,String SubOrder,String curPageName)
    {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        String sub=null;
        
        if(curPageName.equals("GIFT"))
        {
        	sub="sub_gift";
        }
        else
        {
        	sub="sub_genre";
        }

        if(SubOrder.equals("null"))
        {
        	SubOrder="all";
        }
        if(MainOrder.equals("null"))
        {
        	MainOrder="RECENT";
        }
        
        try {
            con = pool.getConnection();
            String strQuery="";
    		strQuery = "select item.* from item,main_platform ";
    		if(!SubOrder.equals("all"))
    		{
    			strQuery+=","+sub+" ";
    		}
    		strQuery+= "where item.main_category=main_platform.id ";
    		strQuery+="and main_platform.name=? ";
    		if(!SubOrder.equals("all"))
    		{
        		strQuery+="and item.sub_category="+sub+".id ";
        		strQuery+="and "+sub+".name=? ";
    		}
    		String IsHotSql="and item.IsHot=1 ";
            String IsDiscountSql="and item.IsDiscount=1 ";
            String orderbySql="order by item.release desc ";
            
            if(MainOrder.equals("HOT"))
            {
            	strQuery+=IsHotSql;
            }
            else if(MainOrder.equals("DISCOUNT"))
            {
            	strQuery+=IsDiscountSql;
            }

            strQuery+=orderbySql;
            pstmt=con.prepareStatement(strQuery);
                
            pstmt.setString(1, curPageName);
            if(!SubOrder.equals("all"))
    		{
            	pstmt.setString(2, SubOrder);
    		}
        
       


            rs = pstmt.executeQuery();


            while (rs.next()) {
                ItemBean itemBean = new ItemBean();
                itemBean.setName(rs.getString("name"));
                itemBean.setPrice(rs.getString("price"));
                itemBean.setRelease(rs.getString("release"));
                itemBean.setMain_category(rs.getString("main_category"));
                itemBean.setSub_category(rs.getString("sub_category"));
                itemBean.setDesc(rs.getString("desc"));
                itemBean.setImgURL(rs.getString("imgURL"));
                itemBean.setIsDiscount(rs.getString("IsDiscount"));
                itemBean.setPercentage(rs.getString("percentage"));
                itemBean.setIsHot(rs.getString("IsHot"));
                itemBean.setQuantity(rs.getString("quantity"));
                vecList.add(itemBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vecList;
    }
    
    public ItemBean getItemInfo(String ItemName)
    {
    	 Connection con = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         ItemBean item = null;
         
         try {
             con = pool.getConnection();
             String strQuery = "select * from item where name=?";

             pstmt = con.prepareStatement(strQuery);
             pstmt.setString(1, ItemName);
             rs = pstmt.executeQuery();

             if (rs.next()) {
            	 item = new ItemBean();
            	 item.setName(rs.getString("name"));
            	 item.setPrice(rs.getString("price"));
            	 item.setRelease(rs.getString("release"));
            	 item.setMain_category(rs.getString("main_category"));
                 item.setSub_category(rs.getString("sub_category"));
                 item.setDesc(rs.getString("desc"));
                 item.setImgURL(rs.getString("imgURL"));
                 item.setIsDiscount(rs.getString("IsDiscount"));
                 item.setPercentage(rs.getString("percentage"));
                 item.setIsHot(rs.getString("IsHot"));
                 item.setQuantity(rs.getString("quantity"));
                 
             }
         } catch (Exception ex) {
             System.out.println("Exception" + ex);
         } finally {
             pool.freeConnection(con, pstmt, rs);
         }
         return item;
    }
    
}
