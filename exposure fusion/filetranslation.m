a=imread('imgs/Big/test2/1.jpg');
b=imread('imgs/Big/test2/22M.jpg');
[M N C]=size(b);
a=a(1:M,1:N,:);
imwrite(a,'imgs/Big/test2/1.jpg');
