CREATE VIEW UserRole_View
AS
    SELECT MUser.id, MUser.first_name, MUser.last_name, MUser.email, Role.id AS role_id, Role.name AS role_name, 
    Permission.id AS permission_id, Permission.name AS permission_name FROM MUser
    JOIN UserRoles ON (MUser.id= UserRoles.user_id)
    JOIN Role ON (Role.id = UserRoles.role_id)
    JOIN RolePermission ON (Role.id =RolePermission.role_id)
    JOIN Permission ON (Permission.id=RolePermission.perm_ID);