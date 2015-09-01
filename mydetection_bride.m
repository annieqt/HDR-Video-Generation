function w=mydetection_bride(i)
motion_area=0.05;
step_gradient=10;
workingDir = 'bride_imgs';

file=sprintf([workingDir '/%d/%d.jpg'],i,1);
img = im2double(rgb2gray(imread(file)));
[m,n,c]=size(img);
w=zeros(m,n,2);
for j=0:1
    cycle_num=0;
    constraint_satisfy=false;
    const=1;
    while constraint_satisfy==false;
        cycle_num=cycle_num+1;
file1=sprintf([workingDir '/%d/%d.jpg'],i,j);
file2=sprintf([workingDir '/%d/%d.jpg'],i+1,j);
file3=sprintf([workingDir '/%d/%d.jpg'],i+2,j);
img0 = im2double(rgb2gray(imread(file1)));
img1 = im2double(rgb2gray(imread(file2)));
img2 = im2double(rgb2gray(imread(file3)));

%% bw1
diff=abs(img1-img0);
%this is a threshold....
avg=sum(sum(diff))/(m*n*1.0);
thre=const*avg;
footstep=fix(((1-thre)/thre)/step_gradient);
% disp(thre);
diff=im2bw(diff,thre);

se = strel('square',12);
A=imdilate(diff,se);
 [L,num]=bwlabel(A);
 bw1=zeros(m,n);
  if (num>0)               
      for k = 1:num
         temp = length( find(L==k) );
         if (temp > 10)
                   bw1=bw1|(L==k);
         end
      end
 else
     bw1=zeros(m,n);
  end
  
%% bw2
diff=abs(img2-img1);
%this is a threshold....
thre=const*sum(sum(diff))/(m*n*1.0);
footstep2=fix(((1-thre)/thre)/step_gradient);
footstep(footstep2<footstep)=footstep2;
diff=im2bw(diff,thre);

se = strel('square',12);
A=imdilate(diff,se);
 [L,num]=bwlabel(A);
 bw2=zeros(m,n);
  if (num>0)               
      for k = 1:num
         temp = length( find(L==k) );
         if (temp > 10)

                   bw2=bw2|(L==k);
         end
      end
 else
     bw2=zeros(m,n);
  end
  
%% end
  [L,num]=bwlabel(bw1&bw2);
  temp=0;
  if (num>0)               
      for k = 1:num
         temp = temp+length( find(L==k) );
      end
 else
     temp=0;
  end
  footstep(footstep==0)=1;
  if(footstep==1&cycle_num>1)
      constraint_satisfy=true;
      %disp(cycle_num);
      break;
  else
    if(temp>m*n*motion_area)
        constraint_satisfy=false;
        const=const*footstep;
    else
        constraint_satisfy=true;
         %disp(cycle_num);
    end
       if(cycle_num>5)
           %wrong estimation of motion area, increase 0.1 or slightly
           %increase threshold which cannot multiply an integer.  
           %big cycle_num decreases efficiency.
            constraint_satisfy=true;
             %disp(cycle_num);
            break;
       end
  end
    end
    
    w(:,:,j+1)=bw1&bw2;
end
w(:,:,1)=~(w(:,:,1)|w(:,:,2));
w(:,:,2)=ones(m,n);
end
