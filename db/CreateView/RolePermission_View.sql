CREATE VIEW RolePermission_View
AS
    SELECT Role.roleID, Role.roleName, Permission.permissionID, Permission.permission AS permission FROM Role
    JOIN RolePermission ON (Role.roleID=RolePermission.roleID)
    JOIN Permission ON (Permission.permissionID=RolePermission.perID);