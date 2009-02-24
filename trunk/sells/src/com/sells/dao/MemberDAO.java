package com.sells.dao;

import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.sells.common.util.PageControl;
import com.sells.search.MemberSearch;

/**
 * Data access object (DAO) for domain model class Member.
 * 
 * @see com.sells.dao.Member
 * @author MyEclipse - Hibernate Tools
 */
public class MemberDAO extends HibernateDaoSupport {
  private static final Log log = LogFactory.getLog(MemberDAO.class);
  // property constants
  public static final String IP = "ip";
  public static final String STATUS = "status";
  public static final String PASSWORD = "password";
  public static final String NAME = "name";
  public static final String EMAIL = "email";
  public static final String TEL = "tel";
  public static final String MOBILE = "mobile";
  public static final String ZIP = "zip";
  public static final String ADDRESS = "address";
  public static final String SELLS_NO = "sellsNo";
  public static final String BIRTH_DT = "birthDt";
  public static final String EP_YN = "epYn";

  protected void initDao() {
    // do nothing
  }

  // 加入會員
  public void save(Member transientInstance) {
    log.debug("saving Member instance");
    try {
      getHibernateTemplate().save(transientInstance);
      log.debug("save successful");
    } catch (RuntimeException re) {
      log.error("save failed", re);
      throw re;
    }
  }

  // 修改會員
  public void update(Member transientInstance) {
    log.debug("saving Member instance");
    try {
      getHibernateTemplate().update(transientInstance);
      log.debug("update successful");
    } catch (RuntimeException re) {
      log.error("update failed", re);
      throw re;
    }
  }

  // 登入會員 //判斷此組Email是否已註冊
  public Member getMember(String memberNo, String sellsNo) {
    log.debug("login Member instance with property1: " + memberNo + ", value: "
        + memberNo);
    log.debug("login Member instance with property2: " + sellsNo + ", value: "
        + sellsNo);
    try {
      StringBuffer sb = new StringBuffer();
      sb
          .append("from Member as model where model.sellsNo = :sellsNo and model.memberNo = :memberNo");
      Query query = getSession().createQuery(sb.toString());
      query.setString("sellsNo", sellsNo);
      query.setString("memberNo", memberNo);
      Member list =(Member) query.list().get(0);
      return list;
    } catch (RuntimeException re) {
      log.error("find by property name failed", re);
      return null ;
    }
  }

  // 登入會員 //判斷此組Email是否已註冊
  public List login(String email, String sellsNo) {
    log.debug("login Member instance with property1: " + email + ", value: "
        + email);
    log.debug("login Member instance with property2: " + sellsNo + ", value: "
        + sellsNo);
    try {
      StringBuffer sb = new StringBuffer();
      sb
          .append("from Member as model where model.sellsNo = :sellsNo and model.email = :email");
      Query query = getSession().createQuery(sb.toString());
      query.setString("sellsNo", sellsNo);
      query.setString("email", email);
      List list = query.list();
      return list;
    } catch (RuntimeException re) {
      log.error("find by property name failed", re);
      throw re;
    }
  }
  
  public void delete(Member persistentInstance) {
    log.debug("deleting Member instance");
    try {
      getHibernateTemplate().delete(persistentInstance);
      log.debug("delete successful");
    } catch (RuntimeException re) {
      log.error("delete failed", re);
      throw re;
    }
  }

  public Member findById(java.lang.String id) {
    log.debug("getting Member instance with id: " + id);
    try {
      Member instance = (Member) getHibernateTemplate().get(
          "com.sells.dao.Member", id);
      return instance;
    } catch (RuntimeException re) {
      log.error("get failed", re);
      throw re;
    }
  }

  public List findByExample(Member instance) {
    log.debug("finding Member instance by example");
    try {
      List results = getHibernateTemplate().findByExample(instance);
      log.debug("find by example successful, result size: " + results.size());
      return results;
    } catch (RuntimeException re) {
      log.error("find by example failed", re);
      throw re;
    }
  }

  public List findByProperty(String propertyName, Object value) {
    log.debug("finding Member instance with property: " + propertyName
        + ", value: " + value);
    try {
      String queryString = "from Member as model where model." + propertyName
          + "= ?";
      return getHibernateTemplate().find(queryString, value);
    } catch (RuntimeException re) {
      log.error("find by property name failed", re);
      throw re;
    }
  }
 
  public List findByIp(Object ip) {
    return findByProperty(IP, ip);
  }

  public List findByStatus(Object status) {
    return findByProperty(STATUS, status);
  }

  public List findByPassword(Object password) {
    return findByProperty(PASSWORD, password);
  }

  public List findByName(Object name) {
    return findByProperty(NAME, name);
  }

  public List findByEmail(Object email) {
    return findByProperty(EMAIL, email);
  }

  public List findByTel(Object tel) {
    return findByProperty(TEL, tel);
  }

  public List findByMobile(Object mobile) {
    return findByProperty(MOBILE, mobile);
  }

  public List findByZip(Object zip) {
    return findByProperty(ZIP, zip);
  }

  public List findByAddress(Object address) {
    return findByProperty(ADDRESS, address);
  }

  public List findBySellsNo(Object sellsNo) {
    return findByProperty(SELLS_NO, sellsNo);
  }

  public List findByBirthDt(Object birthDt) {
    return findByProperty(BIRTH_DT, birthDt);
  }

  public List findByEpYn(Object epYn) {
    return findByProperty(EP_YN, epYn);
  }

  public Member merge(Member detachedInstance) {
    log.debug("merging Member instance");
    try {
      Member result = (Member) getHibernateTemplate().merge(detachedInstance);
      log.debug("merge successful");
      return result;
    } catch (RuntimeException re) {
      log.error("merge failed", re);
      throw re;
    }
  }

  public void attachDirty(Member instance) {
    log.debug("attaching dirty Member instance");
    try {
      getHibernateTemplate().saveOrUpdate(instance);
      log.debug("attach successful");
    } catch (RuntimeException re) {
      log.error("attach failed", re);
      throw re;
    }
  }

  public void attachClean(Member instance) {
    log.debug("attaching clean Member instance");
    try {
      getHibernateTemplate().lock(instance, LockMode.NONE);
      log.debug("attach successful");
    } catch (RuntimeException re) {
      log.error("attach failed", re);
      throw re;
    }
  }

  public static MemberDAO getFromApplicationContext(ApplicationContext ctx) {
    return (MemberDAO) ctx.getBean("MemberDAO");
  }
  public List findMemberSearch(MemberSearch search,String sellsNo,PageControl control ) {
    log.debug("finding Member instance by Search");
    try {
      StringBuffer sql = new StringBuffer();
      sql.append("FROM Member A WHERE 1=1 ") ;
      if (StringUtils.isNotBlank(search.getEmail())) {
        sql.append(" AND A.email like :email ");
      }
      if (StringUtils.isNotBlank(search.getName())) {
        sql.append(" AND A.name like :name ");
      }
      if (StringUtils.isNotBlank(search.getEpYn())) {
        sql.append(" AND A.epYn = :epYn ");
      }
      if (StringUtils.isNotBlank(search.getStatus())) {
        sql.append(" AND A.status = :status ");
      }
      sql.append(" AND A.sellsNo = :sellsNo ");
//      if (StringUtils.isNotBlank(control.getSortField())){
//        sql.append(" Order by ").append(control.getSortField()).append(" ").append(control.getAsc());
//      }
      sql.append(" Order by A.memberNo desc ");
      Query query = getSession().createQuery(sql.toString());
      if (StringUtils.isNotBlank(search.getEmail())) {
        query.setString("email", "%"+search.getEmail()+"%");
      }
      if (StringUtils.isNotBlank(search.getName())) {
        query.setString("name", "%"+search.getName()+"%");
      }
      if (StringUtils.isNotBlank(search.getEpYn())) {
        query.setString("epYn", search.getEpYn());
      }
      if (StringUtils.isNotBlank(search.getStatus())) {
        query.setString("status", search.getStatus());
      }
      query.setString("sellsNo", sellsNo);
      if (control.getNowPage() != -1) {
        query.setFirstResult(control.getStartRow());
        query.setMaxResults(control.getShowrows());
      }
      List results = query.list();
      return results;
    } catch (RuntimeException re) {
      log.error("find by Member failed", re);
      throw re;
    }
  }
  
  public List findMemberSearch2(MemberSearch search,String sellsNo ) {
    log.debug("finding Member instance by Search");
    try {
      StringBuffer sql = new StringBuffer();
      sql.append("FROM Member A WHERE 1=1 ") ;
      if (StringUtils.isNotBlank(search.getBirthDt())) {
        sql.append(" AND SUBSTR(A.birthDt,5,2) = :birthDt ");
      }
      if (StringUtils.isNotBlank(search.getEpYn())) {
        sql.append(" AND A.epYn = :epYn ");
      }
      if (StringUtils.isNotBlank(search.getStatus())) {
        sql.append(" AND A.status = :status ");
      }
      sql.append(" AND A.sellsNo = :sellsNo ");
      sql.append(" Order by A.memberNo desc ");
      log.debug("MemberSearch2:"+sql.toString());
      Query query = getSession().createQuery(sql.toString());
      if (StringUtils.isNotBlank(search.getBirthDt())) {
        query.setString("birthDt", search.getBirthDt());
        log.debug("MemberSearch2:"+search.getBirthDt());
      }
      if (StringUtils.isNotBlank(search.getEpYn())) {
        query.setString("epYn", search.getEpYn());
        log.debug("epYn:"+search.getEpYn());
      }
      if (StringUtils.isNotBlank(search.getStatus())) {
        query.setString("status", search.getStatus());
        log.debug("status:"+search.getStatus());
      }
      query.setString("sellsNo", sellsNo);
      log.debug("sellsNo:"+sellsNo);
      List results = query.list();
      return results;
    } catch (RuntimeException re) {
      log.error("find by Member failed", re);
      throw re;
    }
  }
  
  
  public int findMemberSearchSize(MemberSearch search,String sellsNo) {
    log.debug("finding Member size instance by Search");
    
    try {
      StringBuffer sql = new StringBuffer();
      sql.append("SELECT count(*) FROM Member A WHERE 1=1 ") ;
      if (StringUtils.isNotBlank(search.getEmail())) {
        sql.append(" AND A.email like '%").append(search.getEmail()).append("%'");
      }
      if (StringUtils.isNotBlank(search.getName())) {
        sql.append(" AND A.name like '%").append(search.getName()).append("%'");
      }
      if (StringUtils.isNotBlank(search.getEpYn())) {
        sql.append(" AND A.epYn = '").append(search.getEpYn()).append("'");
      }
      if (StringUtils.isNotBlank(search.getStatus())) {
        sql.append(" AND A.status = '").append(search.getStatus()).append("'");
      }
      sql.append(" AND A.sellsNo = '").append(sellsNo).append("'");
      Object size = this.getHibernateTemplate().find(sql.toString()).get(0);
      sql.setLength(0);
      return Integer.parseInt(size.toString());
    } catch (RuntimeException re) {
      log.error("find by Member size failed", re);
      throw re;
    }
  }
}