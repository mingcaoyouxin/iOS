#include <iostream> 
#include <cstring>
#include <cmath>

using namespace std;

int result[10010];

int main()
{
	//T:测试用例组数 n:食堂数 bot:消费下限 top：消费上限 m:每个食堂的菜的种类数  c:价钱 v:享受度 
	int T,n,bot,top,m,c,v,i,k;
	cin>>T;//输入测试数据的组数
	while(T--)
	{
		//输入n：食堂数 bot:消费下限 top:消费上限
		cin>>n>>bot>>top;

		k=0;
		while(n--)
		{
			//对于每一食堂，首先分配result大得空间
			memset(result,0,sizeof(result));
			cin>>m;//输入每个食堂菜种类数
			while(m--)
			{
				//输入第m种菜的价钱和享受度
				cin>>c>>v;
				for(i=top;i>=c;i--)
					if((result[i-c] > 0) || (0 == i-c))
						result[i] = max(result[i],result[i-c]+v);
			}
			for(i=bot;i<=top;i++)
				k=max(k,result[i]);
		}	
		cout<<k<<endl;
	}
	return 0;
}
