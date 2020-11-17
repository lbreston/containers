function out = CCS_(obj,lag,tau,dim,varargin)

lag=round(lag*obj.fs());

tau=round(tau*obj.fs());

dtemp=eye(numel(obj.dimVals{2}));

for i=2:numel(obj.dimVals{2})
    for j=1:i-1
        C=CCS(obj.data(:,i),obj.data(:,j),lag,tau,dim,varargin{:});
        dtemp(i,j)=C(1);
        dtemp(j,i)=C(2);
    end
end


dnames=[strcat(obj.dimNames{2}," ","1"),strcat(obj.dimNames{2}," ","2")];
dvals=[{obj.dimVals{2}},{obj.dimVals{2}}];

out=types.CausalGraph(dtemp,dnames,dvals);
end