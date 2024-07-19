try 
  x = '';
                x = str2num(x);
                
                fx = '2*sin(x)-10+x^3';
                fx = str2func(['@(x)' fx]);
                y = fx(x);
                
                plot(x, y)
            catch error
                switch (error.identifier)
                    case 'MATLAB:UndefinedFunction'
                        msgbox('Chi nhap ham mot bien','Error','error');
                    otherwise
                        msgbox({error.indentifier,error.message},'Error','error')
                end
end