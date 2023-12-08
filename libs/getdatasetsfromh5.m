%% function reads out all names and paths of datasets that are contained in a h5 file
% input: only h5 filename
% output: 
        %  name: name of datasets
        % group: path within the h5 for the specific dataset
% function only iterates to three levels within the h5 hierarchy. Groups
% and datasets that are nested more deepy within the h5 structure cannot be
% resolved
% ver1: F.Basan 28.03.2023


function [name,group] = getdarasetsfromh5(filename)

I=h5info(filename);
                 %% datasets, die in der ersten Ebene liegen
                 idx=1;
                 for ii =1:length(I.Datasets)
                        name{idx}=I.Datasets(ii).Name;
                        group{idx}=I.Name;
                        idx=idx+1;
                 end
                 %% check wie viele Gruppen gibt es
                 if length(I.Groups)>=1
                    for ii=1:length(I.Groups)
                        for jj=1:length(I.Groups(ii).Datasets)
                            name{idx}= I.Groups(ii).Datasets(jj).Name;
                            group{idx}= I.Groups(ii).Name;
                            idx=idx+1;
                        end
                        if length(I.Groups(ii).Groups)>=1
                            for kk=1:length(I.Groups(ii).Groups)
                                for ll=1:length(I.Groups(ii).Groups(kk).Datasets)
                                    name{idx}= I.Groups(ii).Groups(kk).Datasets(ll).Name;
                                    group{idx}= I.Groups(ii).Groups(kk).Name;
                                    idx=idx+1;
                                end
                                if length(I.Groups(ii).Groups(kk).Groups)>=1
                                    for ll = 1:length(I.Groups(ii).Groups(kk).Groups)
                                        for mm = 1:length(I.Groups(ii).Groups(kk).Groups(ll).Datasets)
                                            name{idx} = I.Groups(ii).Groups(kk).Groups(ll).Datasets(mm).Name;
                                            group{idx} = I.Groups(ii).Groups(kk).Groups(ll).Name;
                                            idx = idx+1;
                                        end
                                    end
                                end
                            end
                        end
                    end
                 end
end