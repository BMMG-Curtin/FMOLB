function X= t_test()
    disp('edited for 2 columns 1.2')
    n=2

	processed_data=ones(3,n);
	t_values=zeros(n,n);
	p_values=zeros(n,n);
	t_values=double(t_values);
	p_values=double(p_values);
	processed_data=double(processed_data);
	

	for i=1:n
		
		rawdata=input('submit column');
		
		[r, c]=size(rawdata);
		
		processed_data(1,i)=mean(rawdata);
		processed_data(2,i)=std(rawdata);
		processed_data(3,i)=r;
	end

		double A;
		double B;
		double mean1
		double mean2
		double std1
		double std2
		double num1
		double num2
		double t
		double p
		
	for i=1:n
		for j=(i+1):n
			
			mean1=processed_data(1,i);
			mean2=processed_data(1,j);
			std1=processed_data(2,i);
			std2=processed_data(2,j);
			num1=processed_data(3,i);
			num2=processed_data(3,j);
			
			A=(num1+num2)/(num1*num2);
			B=(((num1-1)*std1*std1)+((num2-1)*std2*std2))/(num1+num2-2);
			t=abs((mean1-mean2))/(sqrt(A*B));
			v=num1+num2-2;
			t_values(i,j)=t;
%%			tail2P = 2*tcdf(-abs(t),v);
			tdist2T = @(t,v) (1-betainc(v/(v+t^2),v/2,0.5));
			p=1-tdist2T(t,v);
			p_values(i,j)=p;
		end
	end
		disp('t_values')
		disp(t_values);
		save t_values.dat t_values -ascii
		save p_values.dat p_values -ascii
		
%%		disp('processed_data')
		disp(processed_data)
		
end
	
		