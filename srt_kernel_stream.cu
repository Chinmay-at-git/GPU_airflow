__global__ void stream(float* to, float* from, unsigned char *ncls)
{
	int i, j, k, x, y, z;
	i = get_global_id(0);
	j = get_global_id(1);
	k = get_global_id(2);

	if(ncls(cstore(i,j,k)) == FREE || ncls(cstore(i,j,k)) == FFLOW){
		x = i - ci[m].x;
		y = j - ci[m].y;
		z = k - ci[m].z;

		to[i,j,k,m] = from[x,y,z,m];
	}
//printf("I am in stream");
return;
}