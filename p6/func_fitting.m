
%Llamada de la fucion 
function y = func_fitting(x)
% 
kp = x(1);
ki = x(2);
kd = x(3);

% Paso de parametros al controllador
set_param("p6/PID Controller","P","kp","I","ki","D","kd");

%Salida
out = sim("p6.slx", "SrcWorkspace", "Current");

% Variabeles iae y itae
iae = sum(abs(out.error.Data));
%itae = sum(out.error.Time .* abs(out.error.Data));

%out variables 
fprintf('Kp = %3.4f\n', kp);
fprintf('Ki = %3.4f\n', ki);
fprintf('Kd = %3.4f\n', kd);

% Retornamos el valor de la función
y = iae;
end