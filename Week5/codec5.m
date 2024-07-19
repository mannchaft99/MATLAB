switch isempty(app.dataEdit.Value)
case 0
switch isempty(app.data2Edit.Value)
    case 1
        x = str2num(app.dataEdit.Value);

        fx = app.functionEdit.Value;
        fx = str2func(['@(x)' fx]);
        y = fx(x);

        plot(app.myAxe, x, y)
    case 0
        x = str2num(app.dataEdit.Value);
        y = str2num(app.data2Edit.Value);
        fx = str2func(['@(x, y)' app.functionEdit.Value]);
        [X,Y]=meshgrid(x,y);
        z = fx(X,Y);
        mesh(app.myAxe, X,Y,z);
end
case 1
switch isempty(app.data2Edit.Value)
    case 0
        x = str2num(app.data2Edit.Value);

    fx = app.functionEdit.Value;
        fx = str2func(['@(x)' fx]);
        y = fx(x);

        plot(app.myAxe, x, y)
    case 1
        msgbox('Vui long nhap it nhat mot o du lieu','Error','error');
        x = str2num(app.dataEdit.Value);
end
end