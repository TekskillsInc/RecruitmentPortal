package com.recruitmentportal.DAO;


import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.recruitmentportal.DTO.SecurityBean;
import com.recruitmentportal.controller.HandlingException;
import com.recruitmentportal.entity.DepartmentTable;
import com.recruitmentportal.entity.RecruitmentportalLogin;
import com.recruitmentportal.entity.Users;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
@Repository
public class loginDao {
	@Autowired
	private SessionFactory sessfact;
	  private static final Logger logger = Logger.getLogger(loginDao.class);
	/*validating the user*/
	@Transactional
	public RecruitmentportalLogin validateUser(String name,String pwd) throws HandlingException{
		String encoded=getEncodedPwd(pwd);
		RecruitmentportalLogin user=null;
		try {
		Session session = sessfact.getCurrentSession();
		String hql="from RecruitmentportalLogin  where userName='"+name +"'and pwd='"+encoded+"' and empStatus='Active'";
		user=(RecruitmentportalLogin) session.createQuery(hql).uniqueResult();
		}
		catch (Exception ex) {
			logger.error("Exception raised in the method validateUser:", ex);
			String content = "Due to some technical problem application aborted this operation!\n"
					+ "Kindly do other operations.";
			StringWriter errors = new StringWriter();
			ex.printStackTrace(new PrintWriter(errors));
			throw new HandlingException("500", errors.toString(), content);
		}
		return user;
		
	}
	
	/*return Encoded password*/
	@Transactional
	public String getEncodedPwd(String pwd){
		String encoded=Base64.encode(pwd.getBytes());
		return encoded;
	}
	@Transactional
	public  List<DepartmentTable> getDepartments() throws HandlingException{
		List<DepartmentTable> lead =null;
		try {
		Session session = this.sessfact.getCurrentSession();
		String hql="from DepartmentTable";
		 lead = session.createQuery(hql).list();
		}
		catch (Exception ex) {
			logger.error("Exception raised in the method getDepartments:", ex);
			String content = "Due to some technical problem application aborted this operation!\n"
					+ "Kindly do other operations.";
			StringWriter errors = new StringWriter();
			ex.printStackTrace(new PrintWriter(errors));
			throw new HandlingException("500", errors.toString(), content);
		}
		return lead;
		
	}
	@Transactional
	public List<Users> getAllUsers(Integer departmentId) throws HandlingException {
		
		List<Users> uderDetailsList=null;
		try{
		Session session = sessfact.getCurrentSession();
		Criteria criteria=session.createCriteria(Users.class);
		
		criteria.add(Restrictions.eq("dept_id", departmentId));
		criteria.add(Restrictions.eq("Status", 1));
       
		criteria.setProjection(
				Projections.projectionList().add(Projections.property("userName"), "userName")
							.add(Projections.property("emp_number"),"emp_number"));
		criteria.setResultTransformer(new AliasToBeanResultTransformer(Users.class));
		uderDetailsList=criteria.list();
	}
		catch (Exception ex) {
			logger.error("Exception raised in the method getAllUsers:", ex);
			String content = "Due to some technical problem application aborted this operation!\n"
					+ "Kindly do other operations.";
			StringWriter errors = new StringWriter();
			ex.printStackTrace(new PrintWriter(errors));
			throw new HandlingException("500", errors.toString(), content);
		}
		return uderDetailsList;
	}
	@Transactional
	public List<RecruitmentportalLogin> getALLTeamLeads(Integer departmentId,String role) throws HandlingException {
		
		List<RecruitmentportalLogin> uderDetailsList=null;
		try{
		Session session = sessfact.getCurrentSession();
		Criteria criteria=session.createCriteria(RecruitmentportalLogin.class);
		criteria.createAlias("department", "d");
		criteria.add(Restrictions.eq("d.dept_ID", departmentId));
		criteria.add(Restrictions.eq("empStatus", "Active"));
        if(role!=null) {
        	criteria.add(Restrictions.eq("employee_role", role));
        }
		criteria.setProjection(
				Projections.projectionList().add(Projections.property("userName"), "userName")
							.add(Projections.property("emp_number"),"emp_number"));
		criteria.setResultTransformer(new AliasToBeanResultTransformer(Users.class));
		uderDetailsList=criteria.list();
	}
		catch (Exception ex) {
			logger.error("Exception raised in the method getALLTeamLeads:", ex);
			String content = "Due to some technical problem application aborted this operation!\n"
					+ "Kindly do other operations.";
			StringWriter errors = new StringWriter();
			ex.printStackTrace(new PrintWriter(errors));
			throw new HandlingException("500", errors.toString(), content);
		}
		return uderDetailsList;
	}


	@Transactional
	public Users getUserData(String empNo) throws HandlingException{
		Users user=null;
		Integer employeeNo=Integer.parseInt(empNo);
		try{
			Session session = sessfact.getCurrentSession();
			Criteria criteria=session.createCriteria(Users.class,"user");
			criteria.add(Restrictions.eq("emp_number", employeeNo));
			criteria.setProjection(
					Projections.projectionList().add(Projections.property("user.userName"), "userName")
								.add(Projections.property("user.pwd"), "pwd")
								.add(Projections.property("user.Email"),"email")
								.add(Projections.property("user.dept_id"),"dept_id")
								.add(Projections.property("user.emp_number"),"emp_number"));
			criteria.setResultTransformer(new AliasToBeanResultTransformer(Users.class));
			user= (Users) criteria.uniqueResult();
		}
		catch (Exception ex) {
			logger.error("Exception raised in the method getUserData:", ex);
			String content = "Due to some technical problem application aborted this operation!\n"
					+ "Kindly do other operations.";
			StringWriter errors = new StringWriter();
			ex.printStackTrace(new PrintWriter(errors));
			throw new HandlingException("500", errors.toString(), content);
		}
		
		return user;
	}
@Transactional
	public SecurityBean getAllSecuredPwd() throws HandlingException {
	SecurityBean sbean=null;
	
		try{
			Session session = sessfact.getCurrentSession();
			
			String sql="select * from TBL_PWD_SECURITY";
			sbean= (SecurityBean) session.createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(SecurityBean.class)).uniqueResult();
			//String dec_pwd=Jsecurity.decipher(pwd);
				

		}
		catch (Exception ex) {
			logger.error("Exception raised in the method getAllSecuredPwd:", ex);
			String content = "Due to some technical problem application aborted this operation!\n"
					+ "Kindly do other operations.";
			StringWriter errors = new StringWriter();
			ex.printStackTrace(new PrintWriter(errors));
			throw new HandlingException("500", errors.toString(), content);
		}
		
		return sbean;
	}
@Transactional
public String getEmailbyEmpno(int empNo) throws HandlingException {
	String email=null;
	try{
		Session session = sessfact.getCurrentSession();
		String sql="select email_id from TBL_OBT_EMPLOYEE_DESKINFO where emp_number="+empNo+"";
		email=  (String) session.createSQLQuery(sql).uniqueResult();
			

	}
	catch (Exception ex) {
		logger.error("Exception raised in the method getEmailbyEmpno:", ex);
		String content = "Due to some technical problem application aborted this operation!\n"
				+ "Kindly do other operations.";
		StringWriter errors = new StringWriter();
		ex.printStackTrace(new PrintWriter(errors));
		throw new HandlingException("500", errors.toString(), content);
	}
	return email;
	
}
@Transactional
public RecruitmentportalLogin getActiveUsers(Integer departmentId, Integer empNo) throws HandlingException {
	RecruitmentportalLogin rObj=null;
	try{
		Session session = sessfact.getCurrentSession();
		Criteria criteria=session.createCriteria(RecruitmentportalLogin.class,"rl");
		criteria.createAlias("rl.department", "dept");
		criteria.add(Restrictions.eq("dept.dept_ID", departmentId));
		criteria.add(Restrictions.eq("emp_number", empNo));
		criteria.add(Restrictions.eq("empStatus", "Active"));
		rObj=(RecruitmentportalLogin) criteria.uniqueResult();
			

	}
	catch (Exception ex) {
		logger.error("Exception raised in the method getEmailbyEmpno:", ex);
		String content = "Due to some technical problem application aborted this operation!\n"
				+ "Kindly do other operations.";
		StringWriter errors = new StringWriter();
		ex.printStackTrace(new PrintWriter(errors));
		throw new HandlingException("500", errors.toString(), content);
	}
	return rObj;
}
}
