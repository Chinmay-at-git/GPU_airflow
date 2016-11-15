
__global__ void bounce(float* to, float* from, rrnode *dev_bounce, 
	unsigned char *ncls, int revcount)
{
	int i, j, k, x, y, z;
	i = get_global_id(0);
	j = get_global_id(1);
	k = get_global_id(2);

	if(ncls[cstore(i,j,k)] == BOUNDARY ){
		
		for(int l=0;l<DIRECTIONS;++l){
			{
				x = i - ci[l].x;
				y = j - ci[l].y;
				z = k - ci[l].z; 
				if( ncls[cstore(x,y,z)]==FFLOW){
					
				}		
			//	to[store(i,j,k,m)] = curr_value - sub ;
				
			}
		
		}
		
		
	}
//printf("I am in bounce");
return;
}

