__global__ void cascade(float* to, float* from, unsigned char *ncls)
{

	int i, j, k, x, y, z;
	i = get_global_id(0);
	j = get_global_id(1);
	k = get_global_id(2);

	if(ncls[cstore(i,j,k)] == FREE || ncls[cstore(i,j,k)] == FFLOW){
		struct rvector *uptr;
		double rhoptr;
		get_rho_u(from, i, j, k, rhoptr, uptr);
		for(int l=0;l<DIRECTIONS;++l){
			{
				float rho;
				struct rvector u;
				float equi=get_equilibrium(rho,u, l);
				
				float curr_value= from[store(x,y,z,m)];
				float sub =  omega* (curr_value - equi ); 
				to[store(i,j,k,m)] = curr_value - sub ;
				
			}
		
		}
		
		
	}


//printf("I am in cascade");
return;
}
