/**
 * @ClassName common_url
 * @Description 接口地址
 * @Author HouGe
 * @Date 2020-02-03 13:16
 * @Version 1.0
 */


const baseUrl = "https://wxmini.baixingliangfan.cn/baixing/";

const serverPath = {
  "homePageContent" : baseUrl + "wxmini/homePageContent",  // 商店首页
  "homePageBelowContent" : baseUrl + "wxmini/homePageBelowConten", //商城首页热卖商品拉取
  "getCategory" : baseUrl + "wxmini/getCategory", // 商品类别信息
  'getMallGoods': baseUrl+'wxmini/getMallGoods', //商品分类的商品列表
};