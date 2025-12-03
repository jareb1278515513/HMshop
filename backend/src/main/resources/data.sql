INSERT INTO shop_user (id, username, password, nickname, avatar, mobile, gender, add_time, update_time)
VALUES (1, 'demo', '123456', '演示用户', 'http://hmapp.net/static/img/avatar.png', '13800138000', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO user_address (id, user_id, name, tel, country, province, city, county, area_code, postal_code, address_detail, is_default, add_time, update_time, deleted)
VALUES (10, 1, '张三', '13800138000', '中国', '广东省', '深圳市', '南山区', '440305', '518000', '科技园科苑路', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE);

-- 顶级分类
INSERT INTO category (id, name, keywords, description, pid, icon_url, pic_url, level, sort_order, add_time, update_time, deleted)
VALUES (1008000, '数码电器', '手机,平板', '数码潮品', 0, 'http://hmapp.net/static/img/cat_icon.png', 'http://hmapp.net/static/img/cat_pic.png', 'L1', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE);
-- 二级分类
INSERT INTO category (id, name, keywords, description, pid, icon_url, pic_url, level, sort_order, add_time, update_time, deleted)
VALUES (1008002, '手机通讯', '手机', '旗舰机与性价比', 1008000, 'http://hmapp.net/static/img/cat_icon2.png', 'http://hmapp.net/static/img/cat_pic2.png', 'L2', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE);

INSERT INTO brand (id, name, description, pic_url, sort_order, floor_price, add_time, update_time, deleted)
VALUES (1001000, 'Harmony 品牌', '鸿蒙生态精品', 'http://hmapp.net/static/img/brand.png', 1, 1999, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE);

INSERT INTO goods (id, goods_sn, name, category_id, brand_id, gallery, keywords, brief, is_on_sale, sort_order, pic_url, share_url, is_new, is_hot, unit, counter_price, retail_price, detail, add_time, update_time, deleted)
VALUES (1055016, 'HM-001', 'Harmony Phone X', 1008002, 1001000,
        'http://hmapp.net/static/img/goods1.png,http://hmapp.net/static/img/goods1b.png,http://hmapp.net/static/img/goods1c.png',
        '手机,鸿蒙', '旗舰鸿蒙手机', TRUE, 1, 'http://hmapp.net/static/img/goods1.png', 'http://hmapp.net/static/img/goods1.png',
        TRUE, TRUE, '台', 3599, 3299,
        '<p>Harmony Phone X 采用鸿蒙系统，旗舰配置。</p><img src=\"http://hmapp.net/static/img/goods1.png\"/>',
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE);

INSERT INTO goods_attribute (goods_id, attribute, attr_value, add_time, update_time, deleted)
VALUES (1055016, '屏幕', '6.7英寸 OLED', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE),
       (1055016, '电池', '5000mAh', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE);

INSERT INTO goods_specification (id, goods_id, specification, spec_value, pic_url, add_time, update_time, deleted)
VALUES (50101, 1055016, '颜色', '曜石黑', 'http://hmapp.net/static/img/goods1.png', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE),
       (50102, 1055016, '颜色', '皓月白', 'http://hmapp.net/static/img/goods1b.png', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE),
       (50103, 1055016, '存储', '128GB', '', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE),
       (50104, 1055016, '存储', '256GB', '', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE);

INSERT INTO goods_product (id, goods_id, specifications, price, number, url, add_time, update_time, deleted)
VALUES (60101, 1055016, '曜石黑,128GB', 3299, 50, 'http://hmapp.net/static/img/goods1.png', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE),
       (60102, 1055016, '皓月白,256GB', 3599, 30, 'http://hmapp.net/static/img/goods1b.png', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE);

INSERT INTO banner (name, link, url, position, content, enabled, add_time, update_time, deleted)
VALUES ('新品首发', '/pages/DetailPage?did=1055016', 'http://hmapp.net/static/img/banner1.png', 1, 'Harmony X', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE);

INSERT INTO channel (name, icon_url, url)
VALUES ('手机', 'http://hmapp.net/static/img/icon_phone.png', '/pages/CategoryPage?cid=1008002'),
       ('配件', 'http://hmapp.net/static/img/icon_parts.png', '/pages/CategoryPage?cid=1008002'),
       ('优惠', 'http://hmapp.net/static/img/icon_coupon.png', '/pages/CouponPage'),
       ('会员', 'http://hmapp.net/static/img/icon_vip.png', '/pages/LoginPage');

INSERT INTO topic (title, subtitle, price, read_count, pic_url, sort_order, goods, add_time, update_time, deleted, content)
VALUES ('鸿蒙精品', '生态精选', 1999, '1.2k', 'http://hmapp.net/static/img/topic1.png', 1, '[]', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE, '<p>鸿蒙生态产品专题</p>');

INSERT INTO coupon (id, name, description, tag, discount, min, start_time, end_time, days, enabled)
VALUES (1, '新人立减', '全场通用', '新人', 50, 299, CURRENT_TIMESTAMP, DATEADD('DAY', 30, CURRENT_TIMESTAMP), 0, TRUE),
       (2, '手机配件券', '配件使用', '配件', 20, 99, CURRENT_TIMESTAMP, DATEADD('DAY', 60, CURRENT_TIMESTAMP), 0, TRUE);

INSERT INTO coupon_user (user_id, coupon_id, status, start_time, end_time, used_time, add_time)
VALUES (1, 1, 0, CURRENT_TIMESTAMP, DATEADD('DAY', 30, CURRENT_TIMESTAMP), NULL, CURRENT_TIMESTAMP),
       (1, 2, 1, DATEADD('DAY', -10, CURRENT_TIMESTAMP), DATEADD('DAY', 20, CURRENT_TIMESTAMP), DATEADD('DAY', -1, CURRENT_TIMESTAMP), CURRENT_TIMESTAMP);

INSERT INTO cart (id, user_id, goods_id, goods_sn, goods_name, product_id, price, number, specifications, checked, pic_url, add_time, update_time, deleted, fast_add)
VALUES (9001, 1, 1055016, 'HM-001', 'Harmony Phone X', 60101, 3299, 1, '曜石黑,128GB', TRUE, 'http://hmapp.net/static/img/goods1.png', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE, FALSE);

INSERT INTO orders (id, user_id, order_sn, order_status, actual_price, goods_price, freight_price, coupon_price, message, consignee, mobile, address, aftersale_status, add_time, update_time, pay_time, ship_time, confirm_time, deleted)
VALUES (7001, 1, 'HM2023120001', 201, 3299, 3299, 0, 0, '尽快发货', '张三', '13800138000', '广东省深圳市南山区科技园', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, FALSE);

INSERT INTO order_item (order_id, goods_id, goods_name, goods_sn, product_id, number, price, specifications, pic_url)
VALUES (7001, 1055016, 'Harmony Phone X', 'HM-001', 60101, 1, 3299, '曜石黑,128GB', 'http://hmapp.net/static/img/goods1.png');

INSERT INTO collect (user_id, value_id, type, add_time, deleted)
VALUES (1, 1055016, 0, CURRENT_TIMESTAMP, FALSE);

INSERT INTO groupon_rules (id, goods_id, discount, discount_member, expire_time, enabled)
VALUES (3001, 1055016, 200, 2, DATEADD('DAY', 15, CURRENT_TIMESTAMP), TRUE);

INSERT INTO groupon_record (order_id, rules_id, user_id, status, add_time)
VALUES (7001, 3001, 1, 1, CURRENT_TIMESTAMP);
