function plot_(obj,ttl,plottype,t)
nexttile(t)
mlsplot(obj.getdimvals("time"),cat(3,obj.data,obj.error),'')
title(ttl)
xlabel("time")
end

