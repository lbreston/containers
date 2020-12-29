function out = movfun(fcn,mtype,dname,k,o,varargin)

pkg=metaclass(varargin{1}).ContainingPackage.Name;

if isempty(pkg)
    cf=str2func(strcat('@',mtype));
else
    cf=str2func(strcat('@',pkg,'.',mtype));
end

dv=getdimvals(varargin{1},dname);
mn=min(dv);
mx=max(dv);
pts=(mn+.5*k):(k*(1-o)):mx;
n=numel(pts);
for i=0:n-1
    ss=substruct('()',{dname,@(y)((pts(n-i)-.5*k)<=y)&(y<(pts(n-i)+.5*k))});
    intemp=cellfun(@(x)x.subsref(ss),varargin,'UniformOutput',false);
    dtemp(n-i)=fcn(intemp{:});
end

out=cf(dtemp,dname,{pts});
end