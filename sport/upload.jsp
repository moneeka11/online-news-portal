<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="java.sql.*"%>

<%! String title, description, fileName; %>

<%
	DiskFileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	List fileList = upload.parseRequest(request);
	ListIterator iterator = fileList.listIterator();
	
	while(iterator.hasNext()){
		
		try{
			FileItem fileItem = (FileItem) iterator.next();
			
			if(fileItem.isFormField()){
				
				if(fileItem.getFieldName().equals("tl")){
					title = fileItem.getString();
				}
				else if(fileItem.getFieldName().equals("ds")){
					description = fileItem.getString();
				} 
			}
			else{
				fileName = fileItem.getName();
			
				File file = new File("C:\\Users\\user\\eclipse-workspace.jee\\LoginTest\\WebContent\\uploads", fileName);
				fileItem.write(file);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	// database entry
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
		String sql ="INSERT INTO sport(title,image,description) VALUES(?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, title);
		ps.setString(2, fileName);
		ps.setString(3, description);
		ps.executeUpdate();
		response.sendRedirect("sportindex.jsp");
					
	}catch(Exception e){
		e.printStackTrace();
	}
%>