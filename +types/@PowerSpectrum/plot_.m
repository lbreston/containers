function plot_(obj,ttl,plottype,t)
nexttile(t)
mlsplot(obj.getdimvals("freq").',cat(3,obj.data,obj.error),plottype)
title(ttl)
xlabel("Frequency")
ylabel("P(f)")
end