function out = freqfilt_(obj,filter)
cf=str2func(strcat('@',class(obj)));
X=winfft(obj.data,1);
L=size(X,1);
f = repmat(fs(obj)*linspace(0,1,L).',1,size(X,2)); 
ff=filter(f);
Xf=X.*ff;
Y=ifft(Xf,L,1,'symmetric')*L*2;
Y=Y./hamming(L);

out=cf(Y,obj.dimNames,obj.dimVals);

end