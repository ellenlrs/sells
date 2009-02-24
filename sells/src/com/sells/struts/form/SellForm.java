/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sells.struts.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 02-03-2007
 * 
 * XDoclet definition:
 * @struts.form name="sellsForm"
 */
public class SellForm extends ActionForm {
	/*
	 * Generated fields
	 */

  private String payType5;
	/** payType4 property */
	private String payType4;

	/** payType1 property */
	private String payType1;

	/** payType2 property */
	private String payType2;

	/** storeNm property */
	private String storeNm;

	/** sellsNm property */
	private String sellsNm;

	/** payType3 property */
	private String payType3;

	/** homepage property */
	private String homepage;

	/** email property */
	private String email;

	/** sellsNo property */
	private String sellsNo;

	/** sellsLv property */
	private String sellsLv;
  
  private String loginId;
  
  private String passwd;
  
  private String rePasswd ;

	/*
	 * Generated Methods
	 */

	public String getLoginId() {
    return loginId;
  }

  public void setLoginId(String loginId) {
    this.loginId = loginId;
  }

  public String getPasswd() {
    return passwd;
  }

  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }

  public String getRePasswd() {
    return rePasswd;
  }

  public void setRePasswd(String rePasswd) {
    this.rePasswd = rePasswd;
  }

  /** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	/** 
	 * Returns the payType4.
	 * @return String
	 */
	public String getPayType4() {
		return payType4;
	}

	/** 
	 * Set the payType4.
	 * @param payType4 The payType4 to set
	 */
	public void setPayType4(String payType4) {
		this.payType4 = payType4;
	}

	/** 
	 * Returns the payType1.
	 * @return String
	 */
	public String getPayType1() {
		return payType1;
	}

	/** 
	 * Set the payType1.
	 * @param payType1 The payType1 to set
	 */
	public void setPayType1(String payType1) {
		this.payType1 = payType1;
	}

	/** 
	 * Returns the payType2.
	 * @return String
	 */
	public String getPayType2() {
		return payType2;
	}

	/** 
	 * Set the payType2.
	 * @param payType2 The payType2 to set
	 */
	public void setPayType2(String payType2) {
		this.payType2 = payType2;
	}

	/** 
	 * Returns the storeNm.
	 * @return String
	 */
	public String getStoreNm() {
		return storeNm;
	}

	/** 
	 * Set the storeNm.
	 * @param storeNm The storeNm to set
	 */
	public void setStoreNm(String storeNm) {
		this.storeNm = storeNm;
	}

	/** 
	 * Returns the sellsNm.
	 * @return String
	 */
	public String getSellsNm() {
		return sellsNm;
	}

	/** 
	 * Set the sellsNm.
	 * @param sellsNm The sellsNm to set
	 */
	public void setSellsNm(String sellsNm) {
		this.sellsNm = sellsNm;
	}

	/** 
	 * Returns the payType3.
	 * @return String
	 */
	public String getPayType3() {
		return payType3;
	}

	/** 
	 * Set the payType3.
	 * @param payType3 The payType3 to set
	 */
	public void setPayType3(String payType3) {
		this.payType3 = payType3;
	}

	/** 
	 * Returns the homepage.
	 * @return String
	 */
	public String getHomepage() {
		return homepage;
	}

	/** 
	 * Set the homepage.
	 * @param homepage The homepage to set
	 */
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	/** 
	 * Returns the email.
	 * @return String
	 */
	public String getEmail() {
		return email;
	}

	/** 
	 * Set the email.
	 * @param email The email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/** 
	 * Returns the sellsNo.
	 * @return String
	 */
	public String getSellsNo() {
		return sellsNo;
	}

	/** 
	 * Set the sellsNo.
	 * @param sellsNo The sellsNo to set
	 */
	public void setSellsNo(String sellsNo) {
		this.sellsNo = sellsNo;
	}

	/** 
	 * Returns the sellsLv.
	 * @return String
	 */
	public String getSellsLv() {
		return sellsLv;
	}

	/** 
	 * Set the sellsLv.
	 * @param sellsLv The sellsLv to set
	 */
	public void setSellsLv(String sellsLv) {
		this.sellsLv = sellsLv;
	}

  public String getPayType5() {
    return payType5;
  }

  public void setPayType5(String payType5) {
    this.payType5 = payType5;
  }
}