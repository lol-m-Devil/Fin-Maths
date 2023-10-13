mu = mean(data);
C = cov(data);
alpha = 0.99;%my choice
d =0.01;%my choice
%mu= mu'% dimension adjustment

cvx_begin

variables W(54,1)
maximize (W'*mu)
W'*ones(54,1)==1;%constraint 1
for i =1:54
    W(i,1)>=0;%short selling not allowed
end
norminv(alpha)*norm(sqrtm(C)*W) - W'*mu <= d; %constraint 3

cvx_end
W
