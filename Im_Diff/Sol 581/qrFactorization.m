load genTMatrix_affine.mat
A = [I2_transform.T(1,1) I2_transform.T(1,2); I2_transform.T(2,1) I2_transform.T(2,2)];
[Q, R] = qr(A);
K = [R(1,1) 0; 0 R(2, 2)];
S = inv(K)*R;