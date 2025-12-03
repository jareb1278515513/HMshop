import { Category } from "../components/Category"
import { Individual } from "../components/Individual"
import { Selected } from "../components/Selected"
import { ShopCart } from "../components/ShopCart"

@Entry
@Component
struct HomePage {
  @State currentIndex: number = 0;
  @StorageProp('cartRefresh') cartRefresh: number = 0;

  aboutToAppear() {
    AppStorage.setOrCreate('cartRefresh', this.cartRefresh);
  }

  @Builder
  tarBarBuilder(index: number, url: Resource, text: string) {
    Column() {
      Image(url).width(18).height(18).fillColor(index == this.currentIndex ? "#db3d3c" : "#646566")
      Text(text).fontSize(12).fontColor(index == this.currentIndex ? "#db3d3c" : "#646566").margin({ top: 5 })
    }
  }

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        Category()
      }.tabBar(this.tarBarBuilder(0, $r("app.media.jinxuan"), "精选"))

      TabContent() {
        Selected()
      }.tabBar(this.tarBarBuilder(1, $r("app.media.fenlei"), "分类"))

      TabContent() {
        ShopCart({ refreshKey: this.cartRefresh })
      }.tabBar(this.tarBarBuilder(2, $r("app.media.gowu"), "购物"))

      TabContent() {
        Individual()
      }.tabBar(this.tarBarBuilder(3, $r("app.media.wode"), "我的"))
    }.onChange((index) => {
      this.currentIndex = index
      if (index === 2) {
        // 切到购物车时触发刷新
        this.cartRefresh = Date.now();
      }
    })
    .height('100%')
    .width('100%')
    .backgroundColor(Color.White)
    .scrollable(false)
  }
}
