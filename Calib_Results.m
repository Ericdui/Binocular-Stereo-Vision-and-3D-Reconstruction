% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1674.572038884614800 ; 1671.097302126140700 ];

%-- Principal point:
cc = [ 679.546889339921450 ; 521.922340130017910 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.003491124139570 ; 0.021504918459422 ; 0.000358879229324 ; 0.018228866047325 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 15.943842878786656 ; 15.085003077133765 ];

%-- Principal point uncertainty:
cc_error = [ 34.498564462018230 ; 27.762413164823574 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.094304928501928 ; 1.558969090914865 ; 0.005966443993121 ; 0.007569007941206 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 1024;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 15;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.515617e+00 ; -1.787736e+00 ; -2.383051e-01 ];
Tc_1  = [ -1.296317e+02 ; -1.278478e+01 ; 7.546036e+02 ];
omc_error_1 = [ 1.825762e-02 ; 1.489559e-02 ; 3.199714e-02 ];
Tc_error_1  = [ 1.555939e+01 ; 1.267579e+01 ; 7.524354e+00 ];

%-- Image #2:
omc_2 = [ 2.046344e+00 ; 1.565266e+00 ; 1.021188e+00 ];
Tc_2  = [ -6.756009e+01 ; -1.322923e+01 ; 6.972074e+02 ];
omc_error_2 = [ 2.178189e-02 ; 1.041847e-02 ; 2.190741e-02 ];
Tc_error_2  = [ 1.437153e+01 ; 1.164376e+01 ; 7.025593e+00 ];

%-- Image #3:
omc_3 = [ 1.722303e+00 ; 1.381418e+00 ; 1.314562e+00 ];
Tc_3  = [ -1.789383e+01 ; -1.374959e+01 ; 6.872565e+02 ];
omc_error_3 = [ 2.305599e-02 ; 1.272657e-02 ; 1.863805e-02 ];
Tc_error_3  = [ 1.416203e+01 ; 1.142959e+01 ; 6.989110e+00 ];

%-- Image #4:
omc_4 = [ 1.956284e+00 ; 9.163673e-01 ; 5.011953e-01 ];
Tc_4  = [ -1.492434e+02 ; 2.026762e+01 ; 7.572481e+02 ];
omc_error_4 = [ 1.730938e-02 ; 1.234746e-02 ; 2.028174e-02 ];
Tc_error_4  = [ 1.574782e+01 ; 1.281291e+01 ; 7.670788e+00 ];

%-- Image #5:
omc_5 = [ 2.104057e+00 ; 1.190017e+00 ; -2.678863e-01 ];
Tc_5  = [ -1.224700e+02 ; 4.046107e+01 ; 8.583201e+02 ];
omc_error_5 = [ 1.465728e-02 ; 1.400504e-02 ; 2.353529e-02 ];
Tc_error_5  = [ 1.773750e+01 ; 1.438815e+01 ; 8.018597e+00 ];

%-- Image #6:
omc_6 = [ 2.004118e+00 ; 1.665145e+00 ; -1.468142e+00 ];
Tc_6  = [ -6.192529e+01 ; 4.499774e+01 ; 9.749599e+02 ];
omc_error_6 = [ 1.145701e-02 ; 2.106388e-02 ; 2.587140e-02 ];
Tc_error_6  = [ 2.008918e+01 ; 1.621659e+01 ; 8.158573e+00 ];

%-- Image #7:
omc_7 = [ -2.209654e+00 ; -1.391913e+00 ; 5.286400e-02 ];
Tc_7  = [ -1.730674e+02 ; 9.398029e+00 ; 7.766953e+02 ];
omc_error_7 = [ 1.840010e-02 ; 1.347729e-02 ; 2.501845e-02 ];
Tc_error_7  = [ 1.608692e+01 ; 1.314431e+01 ; 7.357062e+00 ];

%-- Image #8:
omc_8 = [ -2.071141e+00 ; -1.151129e+00 ; 4.264947e-01 ];
Tc_8  = [ -1.727348e+02 ; 1.516872e+01 ; 8.378967e+02 ];
omc_error_8 = [ 1.982759e-02 ; 1.273048e-02 ; 2.202892e-02 ];
Tc_error_8  = [ 1.739395e+01 ; 1.417843e+01 ; 7.434667e+00 ];

%-- Image #9:
omc_9 = [ -2.138306e+00 ; -1.536954e+00 ; -8.136322e-01 ];
Tc_9  = [ -1.022834e+02 ; 4.055523e+01 ; 6.539976e+02 ];
omc_error_9 = [ 1.199841e-02 ; 1.770790e-02 ; 2.509661e-02 ];
Tc_error_9  = [ 1.348192e+01 ; 1.092233e+01 ; 6.654351e+00 ];

%-- Image #10:
omc_10 = [ -1.918756e+00 ; -1.815844e+00 ; -1.577825e+00 ];
Tc_10  = [ -2.412634e+01 ; 1.267189e+01 ; 6.588383e+02 ];
omc_error_10 = [ 1.071381e-02 ; 2.181773e-02 ; 2.618501e-02 ];
Tc_error_10  = [ 1.357427e+01 ; 1.094705e+01 ; 6.654364e+00 ];

%-- Image #11:
omc_11 = [ 2.254707e+00 ; 1.650915e+00 ; -8.319188e-01 ];
Tc_11  = [ -9.567882e+01 ; -4.292388e+00 ; 9.711481e+02 ];
omc_error_11 = [ 1.305227e-02 ; 1.793444e-02 ; 2.739660e-02 ];
Tc_error_11  = [ 1.999950e+01 ; 1.620957e+01 ; 8.316105e+00 ];

%-- Image #12:
omc_12 = [ 2.122658e+00 ; 1.693651e+00 ; 1.022561e+00 ];
Tc_12  = [ -8.197652e+01 ; -2.520813e+01 ; 5.914003e+02 ];
omc_error_12 = [ 2.194316e-02 ; 9.717447e-03 ; 2.242417e-02 ];
Tc_error_12  = [ 1.220896e+01 ; 9.924507e+00 ; 6.021847e+00 ];

%-- Image #13:
omc_13 = [ 2.101238e+00 ; 1.195222e+00 ; -3.250449e-02 ];
Tc_13  = [ -1.792221e+02 ; 1.056459e+01 ; 7.362803e+02 ];
omc_error_13 = [ 1.478078e-02 ; 1.380789e-02 ; 2.282027e-02 ];
Tc_error_13  = [ 1.526243e+01 ; 1.252099e+01 ; 7.496242e+00 ];

%-- Image #14:
omc_14 = [ 2.147100e+00 ; 1.715366e+00 ; -1.257130e+00 ];
Tc_14  = [ -1.431333e+02 ; 1.058334e+01 ; 8.429546e+02 ];
omc_error_14 = [ 1.018787e-02 ; 2.112129e-02 ; 2.717634e-02 ];
Tc_error_14  = [ 1.737641e+01 ; 1.419032e+01 ; 7.471213e+00 ];

%-- Image #15:
omc_15 = [ -2.304568e+00 ; -1.569440e+00 ; 5.647589e-02 ];
Tc_15  = [ -8.406809e+01 ; -6.217695e+00 ; 9.417939e+02 ];
omc_error_15 = [ 1.867192e-02 ; 1.447607e-02 ; 2.727279e-02 ];
Tc_error_15  = [ 1.941160e+01 ; 1.567696e+01 ; 8.222014e+00 ];

