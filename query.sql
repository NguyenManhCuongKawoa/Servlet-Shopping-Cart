create database ecommerce_cart;
use ecommerce_cart;app_user

drop table if exists orders;
create table if not exists users (
	id 	int  auto_increment primary key,
    name varchar(50) not null,
    email varchar(50) not null,users
    password varchar(50) not null
);

drop table if exists orders;
create table if not exists products (
	id 	int  auto_increment primary key,
    name varchar(50) not null,
    category  varchar(20) not null,
    price    double   not null, 
    image varchar(255)
);

drop table if exists orders;
create table if not exists orders (
	o_id 	int  auto_increment primary key,
    p_id 	int not null,
    u_id 	int not null,
    o_quantity int not null,
    o_date  date,
    foreign key (u_id) references users(id),
    foreign key (p_id) references products(id)
); 

-- Insert users
insert into users(name, email, password, image_url, role) values('Admin Admin', 'admin@gmail.com', '111111', 'https://muaxegiatot.vn/wp-content/uploads/2020/06/sieu-xe-la-gi-muaxegiatot-vn.jpghttps://www.autocar.co.uk/sites/autocar.co.uk/files/styles/body-image/public/1-ferrari-sf90-stradale-2020-fd-hero-front_0.jpg?itok=SEGd1tLc', 'ADMIN');
insert into users(name, email, password, image_url, role) values('BabyBoy', 'bb@gmail.com', '111111', 'https://muaxegiatot.vn/wp-content/uploads/2020/06/sieu-xe-la-gi-muaxegiatot-vn.jpg', 'USER');
insert into users(name, email, password, image_url, role) values('User User', 'u@gmail.com', '111', null, 'USER');

-- Insert Categories
insert into categories(name, image_url) values('Shoes', 'https://media.istockphoto.com/photos/white-sneaker-on-a-blue-gradient-background-mens-fashion-sport-shoe-picture-id1303978937?b=1&k=20&m=1303978937&s=170667a&w=0&h=az5Y96agxAdHt3XAv7PP9pThdiDpcQ3otWWn9YuJQRc=');
insert into categories(name, image_url) values('Watch', 'https://www.helioswatchstore.com/sites/default/files/balmain-NA.jpg');
insert into categories(name, image_url) values('Computer', 'https://www.splashtop.com/wp-content/uploads/remote-desktop-page-image1-minified.jpg');
insert into categories(name, image_url) values('Clothes', 'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xvdGhlc3xlbnwwfHwwfHw%3D&w=1000&q=80');
insert into categories(name, image_url) values('Glasses', 'https://m.media-amazon.com/images/I/31LxGZgP7FL._SL500_.jpg');
insert into categories(name, image_url) values('Smart Phone', 'https://img.etimg.com/thumb/width-640,height-480,imgsize-63506,resizemode-1,msid-56153038/wealth/spend/6-ways-to-put-your-old-smartphone-to-use/mobile-app-640-480_bccl.jpg');

-- insert Products
insert into products (name, category_id, price, image_url) values('White Sneaker', 1, '1000', 'https://media.istockphoto.com/photos/white-sneaker-on-a-blue-gradient-background-mens-fashion-sport-shoe-picture-id1303978937?b=1&k=20&m=1303978937&s=170667a&w=0&h=az5Y96agxAdHt3XAv7PP9pThdiDpcQ3otWWn9YuJQRc=');
insert into products (name, category_id, price, image_url) values('Blue Sneaker', 1, '2000', 'https://cdn.vox-cdn.com/thumbor/qouGiDTFDkjLzuzMpc-Nj3xjO88=/0x0:2000x1196/1200x800/filters:focal(840x438:1160x758)/cdn.vox-cdn.com/uploads/chorus_image/image/70267766/a16z_rtfkt_sneakers.0.jpg');
insert into products (name, category_id, price, image_url) values('Focus Sneaker', 1, '3000', 'https://cf.shopee.ph/file/5139c66abeb9d177886ad21bfa7e0f82');
insert into products (name, category_id, price, image_url) values('Life is a tough Sneaker', 1, '4000', 'https://image.made-in-china.com/202f0j00iKWYrLZMHUqD/New-Style-Fashion-Shoe-Daddy-Shoes-Men-s-Shoe-Sneakers-Shoe-Casual-Shoe.jpg');
insert into products (name, category_id, price, image_url) values('Sneaker Buti', 1, '5000', 'https://image.made-in-china.com/2f0j00AugGRWdJrhcB/2019-Spring-New-Style-Super-Hot-Fashion-Sports-Men-Shoes.jpg');
insert into products (name, category_id, price, image_url) values('Shoes For Men', 1, '5000', 'https://image.made-in-china.com/2f0j00AugGRWdJrhcB/2019-Spring-New-Style-Super-Hot-Fashion-Sports-Men-Shoes.jpg');
insert into products (name, category_id, price, image_url) values('Sneaker', 1, '5000', 'https://image.made-in-china.com/2f0j00AugGRWdJrhcB/2019-Spring-New-Style-Super-Hot-Fashion-Sports-Men-Shoes.jpg');
insert into products (name, category_id, price, image_url) values('Watch Silver', 2, '500', 'https://cdn.shopify.com/s/files/1/0027/2357/7914/articles/A22A1281_1200x.jpg?v=1597178612');
insert into products (name, category_id, price, image_url) values('Watch Gold', 2, '230', 'https://image.shutterstock.com/image-vector/vector-cartoon-classic-mens-wrist-260nw-615428642.jpg');
insert into products (name, category_id, price, image_url) values('Smart Watch', 2, '8780', 'https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/8/15/637646632610588704_samsung-galaxy-watch-4-den-small-2.jpg');
insert into products (name, category_id, price, image_url) values('Apple Watch', 2, '780', 'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2020/11/04/se-40.png');
insert into products (name, category_id, price, image_url) values('Black Watch', 2, '340', 'https://m.media-amazon.com/images/I/71gdBQP+qGL._UY741_.jpg');
insert into products (name, category_id, price, image_url) values('Redux Analogue Black', 2, '720', 'https://images-na.ssl-images-amazon.com/images/I/819AnkHJAlL._UY445_.jpg');
insert into products (name, category_id, price, image_url) values('Apple Watch White', 2, '543', 'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2020/11/04/se-40.png');