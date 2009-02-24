package com.sells.dao;

import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.sells.common.util.SellsSearch;

/**
 * Data access object (DAO) for domain model class Sells.
 * 
 * @see com.sells.dao.Sells
 * @author MyEclipse - Hibernate Tools
 */
public class SellsDAO extends HibernateDaoSupport {
  private static final Log log = LogFactory.getLog(SellsDAO.class);
  // property constants
  public static final String SELLS_NM = "sellsNm";
  public static final String EMAIL = "email";
  public static final String STORE_NM = "storeNm";
  public static final String HOMEPAGE = "homepage";
  public static final String PAY_TYPE1 = "payType1";
  public static final String PAY_TYPE2 = "payType2";
  public static final String PAY_TYPE3 = "payType3";
  public static final String PAY_TYPE4 = "payType4";
  public static final String JOIN_DT = "joinDt";
  public static final String EXPIRED_DT = "expiredDt";
  public static final String SELLES_LV = "sellesLv";
  public static final String PAY_DESC = "payDesc";
  public static final String FREIGHT_FARE = "freightFare";
  public static final String FREIGHT_TP = "freightTp";
  public static final String NOFREIGHT_FARE = "nofreightFare";
  public static final String NOFREIGHT_QTY = "nofreightQty";
  public static final String LOW_ACCOUNT = "lowAccount";

  protected void initDao() {
    // do nothing
  }

  public void save(Sells transientInstance) {
    log.debug("saving Sells instance");
    try {
      getHibernateTemplate().save(transientInstance);
      log.debug("save successful");
    } catch (RuntimeException re) {
      log.error("save failed", re);
      throw re;
    }
  }

  public void update(Sells transientInstance) {
    log.debug("saving Sells instance");
    try {
      getHibernateTemplate().update(transientInstance);
      log.debug("save successful");
    } catch (RuntimeException re) {
      log.error("save failed", re);
      throw re;
    }
  }

  public void delete(Sells persistentInstance) {
    log.debug("deleting Sells instance");
    try {
      getHibernateTemplate().delete(persistentInstance);
      log.debug("delete successful");
    } catch (RuntimeException re) {
      log.error("delete failed", re);
      throw re;
    }
  }

  public Sells findById(java.lang.String id) {
    log.debug("getting Sells instance with id: " + id);
    try {
      Sells instance = (Sells) getHibernateTemplate().get(
          "com.sells.dao.Sells", id);
      return instance;
    } catch (RuntimeException re) {
      log.error("get failed", re);
      throw re;
    }
  }

  public List findSellsSearch(SellsSearch search) {
    log.debug("finding Search instance by example");
    try {
      StringBuffer sql = new StringBuffer();
      sql.append(" select {LoginData.*},{Sells.*} from ");
      sql.append(" LOGIN_DATA LoginData, SELLS Sells");
      sql.append(" where ");
      sql.append(" Sells.SELLS_NO = LoginData.SELLS_NO ");
      if (StringUtils.isNotBlank(search.getLoginId())) {
        sql.append(" AND LoginData.LOGIN_ID like :loginId");
      }
      if (StringUtils.isNotBlank(search.getExpiredDt())) {
        sql.append(" AND Sells.EXPIRED_DT like :expiredDt");
      }
      if (StringUtils.isNotBlank(search.getSellsLv())) {
        sql.append(" AND Sells.SELLS_LV = :sellsLv");
      }
      if (StringUtils.isNotBlank(search.getSellsNm())) {
        sql.append(" AND Sells.SELLS_NM like :sellsNm");
      }
      if (StringUtils.isNotBlank(search.getStoreNm())) {
        sql.append(" AND Sells.STORE_NM like :storeNm");
      }
      if (StringUtils.isNotBlank(search.getSellsNo())) {
        sql.append(" AND Sells.SELLS_NO like :sellsNo");
      }
      if (StringUtils.isNotBlank(search.getSort())) {
        sql.append(" Order by ").append(search.getSort()).append(" ").append(
            search.getAsc());
      }
      Query query = getSession().createSQLQuery(sql.toString()).addEntity(
          "LoginData", LoginData.class).addEntity("Sells", Sells.class);
      if (StringUtils.isNotBlank(search.getLoginId())) {
        query.setString("loginId", "%" + search.getLoginId() + "%");
      }
      if (StringUtils.isNotBlank(search.getExpiredDt())) {
        query.setString("expiredDt", "%" + search.getExpiredDt() + "%");
      }
      if (StringUtils.isNotBlank(search.getSellsLv())) {
        query.setString("sellsLv", search.getSellsLv());
      }
      if (StringUtils.isNotBlank(search.getSellsNm())) {
        query.setString("sellsNm", "%" + search.getSellsNm() + "%");
      }
      if (StringUtils.isNotBlank(search.getStoreNm())) {
        query.setString("storeNm", "%" + search.getStoreNm() + "%");
      }
      if (StringUtils.isNotBlank(search.getSellsNo())) {
        query.setString("sellsNo", "%" + search.getSellsNo() + "%");
      }
      if (search.getPages() > 0) {
        query.setFirstResult(search.getPageSize() * search.getPages());
        query.setMaxResults(search.getPageSize());
      }
      List results = query.list();
      return results;
    } catch (RuntimeException re) {
      log.error("find by example failed", re);
      throw re;
    }
  }

  public List findSells(SellsSearch search) {
    log.debug("finding Sells instance by search");
    try {
      StringBuffer sql = new StringBuffer();
      sql.append(" select {LoginData.*},{Sells.*} from ");
      sql.append(" LOGIN_DATA LoginData, SELLS Sells");
      sql.append(" where ");
      sql.append(" Sells.SELLS_NO = LoginData.SELLS_NO ");
      sql.append(" AND LoginData.LOGIN_ID = :loginId");
      sql.append(" AND Sells.SELLS_NM = :sellsNm");
      sql.append(" AND Sells.EMAIL = :email");
      Query query = getSession().createSQLQuery(sql.toString()).addEntity(
          "LoginData", LoginData.class).addEntity("Sells", Sells.class);
      query.setString("loginId", search.getLoginId());
      query.setString("sellsNm", search.getSellsNm());
      query.setString("email", search.getEmail());
      List results = query.list();
      return results;
    } catch (RuntimeException re) {
      log.error("find by example failed", re);
      throw re;
    }
  }

  public int findSellsSearchSize(SellsSearch search) {
    log.debug("finding Country size by SellsSearch");
    try {
      StringBuffer sql = new StringBuffer();
      sql.append(" select count(*) from ");
      sql.append(" LoginData LoginData, Sells Sells");
      sql.append(" where ");
      sql.append(" Sells.sellsNo = LoginData.sellsNo ");
      if (StringUtils.isNotBlank(search.getLoginId())) {
        sql.append(" AND LoginData.loginId like '%").append(
            search.getLoginId()).append("%'");
      }
      if (StringUtils.isNotBlank(search.getExpiredDt())) {
        sql.append(" AND Sells.expiredDt like '%").append(
            search.getExpiredDt()).append("%'");
      }
      if (StringUtils.isNotBlank(search.getSellsLv())) {
        sql.append(" AND Sells.sellsLv = '").append(search.getSellsLv())
            .append("'");
      }
      if (StringUtils.isNotBlank(search.getSellsNm())) {
        sql.append(" AND Sells.sellsNm like '%").append(search.getSellsNm())
            .append("%'");
      }
      if (StringUtils.isNotBlank(search.getStoreNm())) {
        sql.append(" AND Sells.storeNm like '%").append(search.getStoreNm())
            .append("%'");
      }
      if (StringUtils.isNotBlank(search.getSellsNo())) {
        sql.append(" AND Sells.sellsNo like '%").append(search.getSellsNo())
            .append("%'");
      }
      Object size = this.getHibernateTemplate().find(sql.toString()).get(0);
      sql.setLength(0);
      return Integer.parseInt(size.toString());
    } catch (RuntimeException re) {
      log.error("find by example failed", re);
      throw re;
    }
  }

  public List findByExample(Sells instance) {
    log.debug("finding Sells instance by example");
    try {
      List results = getSession().createCriteria("com.sells.dao.Sells").add(
          Example.create(instance)).list();
      log.debug("find by example successful, result size: " + results.size());
      return results;
    } catch (RuntimeException re) {
      log.error("find by example failed", re);
      throw re;
    }
  }

  public List findByProperty(String propertyName, Object value) {
    log.debug("finding Sells instance with property: " + propertyName
        + ", value: " + value);
    try {
      String queryString = "from Sells as model where model." + propertyName
          + "= ?";
      return getHibernateTemplate().find(queryString, value);
    } catch (RuntimeException re) {
      log.error("find by property name failed", re);
      throw re;
    }
  }

  public List findBySellsNm(Object sellsNm) {
    return findByProperty(SELLS_NM, sellsNm);
  }

  public List findByEmail(Object email) {
    return findByProperty(EMAIL, email);
  }

  public List findByStoreNm(Object storeNm) {
    return findByProperty(STORE_NM, storeNm);
  }

  public List findByHomepage(Object homepage) {
    return findByProperty(HOMEPAGE, homepage);
  }

  public List findByPayType1(Object payType1) {
    return findByProperty(PAY_TYPE1, payType1);
  }

  public List findByPayType2(Object payType2) {
    return findByProperty(PAY_TYPE2, payType2);
  }

  public List findByPayType3(Object payType3) {
    return findByProperty(PAY_TYPE3, payType3);
  }

  public List findByPayType4(Object payType4) {
    return findByProperty(PAY_TYPE4, payType4);
  }

  public List findByJoinDt(Object joinDt) {
    return findByProperty(JOIN_DT, joinDt);
  }

  public List findByExpiredDt(Object expiredDt) {
    return findByProperty(EXPIRED_DT, expiredDt);
  }

  public List findBySellesLv(Object sellesLv) {
    return findByProperty(SELLES_LV, sellesLv);
  }

  public List findByPayDesc(Object payDesc) {
    return findByProperty(PAY_DESC, payDesc);
  }

  public List findByFreightFare(Object freightFare) {
    return findByProperty(FREIGHT_FARE, freightFare);
  }

  public List findByFreightTp(Object freightTp) {
    return findByProperty(FREIGHT_TP, freightTp);
  }

  public List findByNofreightFare(Object nofreightFare) {
    return findByProperty(NOFREIGHT_FARE, nofreightFare);
  }

  public List findByNofreightQty(Object nofreightQty) {
    return findByProperty(NOFREIGHT_QTY, nofreightQty);
  }

  public List findByLowAccount(Object lowAccount) {
    return findByProperty(LOW_ACCOUNT, lowAccount);
  }

  public Sells merge(Sells detachedInstance) {
    log.debug("merging Sells instance");
    try {
      Sells result = (Sells) getHibernateTemplate().merge(detachedInstance);
      log.debug("merge successful");
      return result;
    } catch (RuntimeException re) {
      log.error("merge failed", re);
      throw re;
    }
  }

  public void attachDirty(Sells instance) {
    log.debug("attaching dirty Sells instance");
    try {
      getHibernateTemplate().saveOrUpdate(instance);
      log.debug("attach successful");
    } catch (RuntimeException re) {
      log.error("attach failed", re);
      throw re;
    }
  }

  public void attachClean(Sells instance) {
    log.debug("attaching clean Sells instance");
    try {
      getHibernateTemplate().lock(instance, LockMode.NONE);
      log.debug("attach successful");
    } catch (RuntimeException re) {
      log.error("attach failed", re);
      throw re;
    }
  }

  public static SellsDAO getFromApplicationContext(ApplicationContext ctx) {
    return (SellsDAO) ctx.getBean("SellsDAO");
  }
}