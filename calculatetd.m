function calculatetd (image1, image2)
[im1, des1, loc1] = sift(image1);
[im2, des2, loc2] = sift(image2);

distRatio = 0.6;   
des2t = des2';                          
for i = 1 : size(des1,1)
   dotprods = des1(i,:) * des2t;        
   [vals,indx] = sort(acos(dotprods));  
   
   if (vals(1) < distRatio * vals(2))
      match(i) = indx(1);
   else
      match(i) = 0;
   end
end
 j = 1;
for i = 1: size(des1,1)
  if (match(i) > 0)
  XL(1,j) = loc1(i,1);
  XL(2,j) = loc1(i,2);
  XR(1,j) = loc2(match(i),1);
  XR(2,j) = loc2(match(i),2);
  j=j+1;
  end
end
load Calib_Results_stereo;
[Xc_1_left,Xc_1_right] = stereo_triangulation(XL,XR,om,T,fc_left,cc_left,kc_left,alpha_c_left,fc_right,cc_right,kc_right,alpha_c_right);



