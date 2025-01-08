CREATE DATABASE IF NOT EXISTS pottery_admin;
CREATE TABLE IF NOT EXISTS user (
                                    id INT AUTO_INCREMENT PRIMARY KEY,       -- 用户ID
                                    username VARCHAR(255) NOT NULL,          -- 用户名
    phone_number VARCHAR(15),                -- 手机号码
    email VARCHAR(255),                      -- 邮箱
    password VARCHAR(255) NOT NULL,          -- 密码
    type VARCHAR(50)                         -- 用户类型（如：管理员、普通用户等）
    );
CREATE TABLE  IF NOT EXISTS pottery (
                                        uid VARCHAR(255) PRIMARY KEY,            -- 紫砂壶UID
    creator VARCHAR(255),                    -- 制作者
    origin VARCHAR(255),                     -- 产地
    production_time DATE,                    -- 生产时间
    craftsmanship_process TEXT,              -- 工艺流程
    image_url VARCHAR(255),                  -- 图片（可以存放图片路径或URL）
    );
CREATE TABLE  IF NOT EXISTS production_process (
                                                   id INT AUTO_INCREMENT PRIMARY KEY,       -- 生产流程ID
                                                   process_name VARCHAR(255),                -- 生产工艺名称
    inspection_result VARCHAR(255),           -- 检验结果
    quality_certification VARCHAR(255),       -- 质检合格证明
    pottery_uid VARCHAR(255),                 -- 对应紫砂壶UID
    FOREIGN KEY (pottery_uid) REFERENCES pottery(uid) ON DELETE CASCADE
    );
CREATE TABLE  IF NOT EXISTS sales_record (
                                             id INT AUTO_INCREMENT PRIMARY KEY,        -- 销售记录ID
                                             distributor_info VARCHAR(255),             -- 经销商信息
    sale_time DATETIME,                       -- 销售时间
    buyer_id INT,                             -- 购买人ID（关联 `user` 表）
    pottery_uid VARCHAR(255),                 -- 紫砂壶UID
    FOREIGN KEY (buyer_id) REFERENCES user(id) ON DELETE SET NULL,
    FOREIGN KEY (pottery_uid) REFERENCES pottery(uid) ON DELETE CASCADE
    );
CREATE TABLE  IF NOT EXISTS verification_history (
                                                     id INT AUTO_INCREMENT PRIMARY KEY,        -- 验证历史ID
                                                     verifier_id INT,                          -- 验证人ID（关联 `user` 表）
                                                     verification_result VARCHAR(255),         -- 验证结果
    pottery_uid VARCHAR(255),                 -- 对应验证的紫砂壶UID
    FOREIGN KEY (verifier_id) REFERENCES user(id) ON DELETE SET NULL,
    FOREIGN KEY (pottery_uid) REFERENCES pottery(uid) ON DELETE CASCADE
    );
-- 1. 插入用户数据
INSERT INTO user (username, phone_number, email, password, type)
VALUES
    ('Alice', '13800138000', 'alice@example.com', 'password123', 'admin'),
    ('Bob', '13900139000', 'bob@example.com', 'password123', 'user'),
    ('Charlie', '13700137000', 'charlie@example.com', 'password123', 'user');

-- 2. 插入紫砂壶数据
INSERT INTO pottery (uid, creator, origin, production_time, craftsmanship_process, image_url, production_process)
VALUES
    ('POT12345', 'Li Ming', 'Jingdezhen', '2023-05-01', 'Handcrafted, Fired in Kiln', 'http://example.com/pot1.jpg'  ),
    ('POT12346', 'Wang Wei', 'Yixing', '2023-06-01', 'Handcrafted, Fired in Kiln', 'http://example.com/pot2.jpg' ,
    ('POT12347', 'Zhang San', 'Anji', '2023-07-01', 'Handcrafted, Fired in Kiln', 'http://example.com/pot3.jpg' );

-- 3. 插入生产流程数据
INSERT INTO production_process (process_name, inspection_result, quality_certification, pottery_uid)
VALUES
    ('Handcrafting', 'Passed', 'Yes', 'POT12345'),
    ('Firing', 'Passed', 'Yes', 'POT12345'),
    ('Inspection', 'Passed', 'Yes', 'POT12345'),
    ('Handcrafting', 'Passed', 'Yes', 'POT12346'),
    ('Firing', 'Failed', 'No', 'POT12346'),
    ('Inspection', 'Passed', 'Yes', 'POT12346'),
    ('Handcrafting', 'Passed', 'Yes', 'POT12347'),
    ('Firing', 'Passed', 'Yes', 'POT12347'),
    ('Inspection', 'Passed', 'Yes', 'POT12347');

-- 4. 插入销售记录数据
INSERT INTO sales_record (distributor_info, sale_time, buyer_id, pottery_uid)
VALUES
    ('Distributor A', '2023-06-15 10:00:00', 2, 'POT12345'),
    ('Distributor B', '2023-06-20 14:30:00', 3, 'POT12346'),
    ('Distributor C', '2023-07-10 09:00:00', 1, 'POT12347');

-- 5. 插入验证历史数据，添加验证人ID (verifier_id)
INSERT INTO verification_history (verifier_id, verification_result, pottery_uid)
VALUES
    (1, 'Verified', 'POT12345'),  -- 验证人 ID 为 1，紫砂壶 UID 为 POT12345，验证结果为 'Verified'
    (2, 'Verified', 'POT12346'),  -- 验证人 ID 为 2，紫砂壶 UID 为 POT12346，验证结果为 'Verified'
    (3, 'Failed', 'POT12347');    -- 验证人 ID 为 3，紫砂壶 UID 为 POT12347，验证结果为 'Failed'




