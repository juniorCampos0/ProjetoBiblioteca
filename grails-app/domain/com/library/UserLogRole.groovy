package com.library

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class UserLogRole implements Serializable {

	private static final long serialVersionUID = 1

	UserLog userLog
	Role role

	UserLogRole(UserLog u, Role r) {
		this()
		userLog = u
		role = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof UserLogRole)) {
			return false
		}

		other.userLog?.id == userLog?.id && other.role?.id == role?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (userLog) builder.append(userLog.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static UserLogRole get(long userLogId, long roleId) {
		criteriaFor(userLogId, roleId).get()
	}

	static boolean exists(long userLogId, long roleId) {
		criteriaFor(userLogId, roleId).count()
	}

	private static DetachedCriteria criteriaFor(long userLogId, long roleId) {
		UserLogRole.where {
			userLog == UserLog.load(userLogId) &&
			role == Role.load(roleId)
		}
	}

	static UserLogRole create(UserLog userLog, Role role, boolean flush = false) {
		def instance = new UserLogRole(userLog: userLog, role: role)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(UserLog u, Role r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = UserLogRole.where { userLog == u && role == r }.deleteAll()

		if (flush) { UserLogRole.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(UserLog u, boolean flush = false) {
		if (u == null) return

		UserLogRole.where { userLog == u }.deleteAll()

		if (flush) { UserLogRole.withSession { it.flush() } }
	}

	static void removeAll(Role r, boolean flush = false) {
		if (r == null) return

		UserLogRole.where { role == r }.deleteAll()

		if (flush) { UserLogRole.withSession { it.flush() } }
	}

	static constraints = {
		role validator: { Role r, UserLogRole ur ->
			if (ur.userLog == null || ur.userLog.id == null) return
			boolean existing = false
			UserLogRole.withNewSession {
				existing = UserLogRole.exists(ur.userLog.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['userLog', 'role']
		version false
	}
}
