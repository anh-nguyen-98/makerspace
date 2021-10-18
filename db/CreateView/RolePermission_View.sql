CREATE VIEW RolePermission_View
AS
    SELECT Role.id as role_id, Role.name as role_name, Permission.id as perm_id, Permission.name AS perm_name FROM Role
    JOIN RolePermission ON (Role.id=RolePermission.role_id)
    JOIN Permission ON (Permission.id=RolePermission.perm_id);