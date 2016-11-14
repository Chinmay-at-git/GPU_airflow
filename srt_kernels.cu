//...............................................................
// srt_kernels.cu (starter kit)
//
#include "srt_kernel_stream.cu"
#include "srt_kernel_bounce.cu"
#include "srt_kernel_cascade.cu"
__device__ __forceinline__ int get_global_id(int idx)
{
switch(idx){
	case 0:
		return blockIdx.x*blockDim.x+threadIdx.x;
	case 1:
		return blockIdx.y*blockDim.y+threadIdx.y;
	case 2:
		return blockIdx.z*blockDim.z+threadIdx.z;
	}
return 0;
}

__device__ double dotDIR(double a[DIRECTIONS], double b[DIRECTIONS])
{
int i;
double sum = 0.0;
for(i=0;i<DIRECTIONS;i++) sum += a[i]*b[i];
return(sum);
}

__device__ double rdot(struct rvector u, struct rvector v)
{
return(u.x*v.x+u.y*v.y+u.z*v.z);
}

__device__ double dotci(int i,struct rvector u)
{
struct rvector thisci;
thisci.x = (double)(ci[i].x);
thisci.y = (double)(ci[i].y);
thisci.z = (double)(ci[i].z);
return(rdot(thisci,u));
}

__device__ void get_rho_u(float *to, int i, int j, int k, double *rhoptr, 
	struct rvector *uptr)
{
return;
}

__device__ double get_equilibrium(double rho, struct rvector u, int m)
{
	double ddot;
	ddot = dotci(m, u);
	return(link_weight[m]*rho*(1.0+3.0*ddot+4.5*ddot*ddot-1.5*dot(u,u)));
}


