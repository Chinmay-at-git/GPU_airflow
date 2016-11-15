
__global__ void bounce(float* to, float* from, rrnode *dev_bounce, 
	unsigned char *ncls, int revcount)
{
	int i, j, k, x, y, z;
	int n= get_global_id(0);
	if(n>=revcount)
		return; 
	i=dev_bounce[n].i;
	j=dev_bounce[n].j;
	k=dev_bounce[n].k;
	
	for(int l=0;l<DIRECTIONS;++l){
		
			x = i - ci[l].x;
			y = j - ci[l].y;
			z = k - ci[l].z; 
			if( dev_bounce[n].del[l]>-1 && ncls[cstore(i,j,k)] == BOUNDARY  && ncls[cstore(x,y,z)] == FFLOW ){
					float temp = from[store(x,y,z,l)];
					if(temp > 0){
							temp=-temp;						
					}
					to[store(x,y,z,l)]=temp;
				}		
			//	to[store(i,j,k,m)] = curr_value - sub ;
				
			
		
	}
		
		
	
//printf("I am in bounce");
return;
}

