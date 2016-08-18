package net.pkusoft.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StringUtils;

public final class BeanUtils {

	private static Log log = LogFactory.getLog( BeanUtils.class );
	/**
	 * 两对象之间的拷贝(在目标对象中存在的所有set方法，如果在源对象中存在对应的get方法，不管源对象的get方法的返回值是否为null,都进行拷贝)
	 * 仅拷贝方法名及方法返回类型完全一样的属性值
	 * 
	 * @param desc
	 *            目标对象
	 * @param orig
	 *            源对象
	 * @param excludeFields
	 *            不拷贝的field（多个用逗号隔开）
	 */
	public static void copyPropertiesNotForce( Object desc, Object orig, String excludeFields ) {
		copyPropertiesNotForce( desc, orig, excludeFields, true );
	}
	/**
	 * 两对象之间的拷贝(在目标对象中存在的所有set方法，如果在源对象中存在对应的get方法，不管源对象的get方法的返回值是否为null,都进行拷贝)
	 * 仅拷贝方法名及方法返回类型完全一样的属性值
	 * 
	 * @param desc
	 *            目标对象
	 * @param orig
	 *            源对象
	 * @param excludeFields
	 *            源对象
	 * @param isCopyNull
	 *            为null的属性是否拷贝(true拷贝null属性;false不拷贝null属性)
	 * @param excludeFields
	 *            不拷贝的field（多个用逗号隔开）
	 */
	public static void copyPropertiesNotForce( Object desc, Object orig, String excludeFields, boolean isCopyNull ) {
		Class<?> origClass = orig.getClass();
		Class<?> descClass = desc.getClass();

		Method[] descMethods = descClass.getMethods();
		Method[] origMethods = origClass.getMethods();

		boolean needExclude = false; // 是否需要过滤部分字段
		if ( !StringUtils.isEmpty( excludeFields ) ) {
			needExclude = true;
			excludeFields = "," + excludeFields.toLowerCase() + ",";
		}

		Map<String, Method> methodMap = new HashMap<String, Method>();
		for ( int i = 0; i < origMethods.length; i++ ) {
			Method method = origMethods[ i ];
			String methodName = method.getName();
			if ( !methodName.equals( "getClass" ) && methodName.startsWith( "get" )
					&& ( method.getParameterTypes() == null || method.getParameterTypes().length == 0 ) ) {
				if ( needExclude && excludeFields.indexOf( methodName.substring( 3 ).toLowerCase() ) > -1 ) {
					continue;
				}
				methodMap.put( methodName, method );
			}
		}
		for ( int i = 0; i < descMethods.length; i++ ) {
			Method method = descMethods[ i ];
			String methodName = method.getName();
			if ( !methodName.equals( "getClass" ) && methodName.startsWith( "get" )
					&& ( method.getParameterTypes() == null || method.getParameterTypes().length == 0 ) ) {
				if ( methodMap.containsKey( methodName ) ) {
					Method origMethod = ( Method ) methodMap.get( methodName );
					try {
						if ( method.getReturnType().equals( origMethod.getReturnType() ) ) {
							Object returnObj = origMethod.invoke( orig, null );
							if ( !isCopyNull && returnObj == null ) {
								continue;
							}

							String field = methodName.substring( 3 );
							String setMethodName = "set" + field;
							Method setMethod = descClass.getMethod( setMethodName, new Class[ ]{ method.getReturnType() } );
							setMethod.invoke( desc, new Object[ ]{ returnObj } );
						}
					} catch ( IllegalArgumentException e ) {
						e.printStackTrace();
					} catch ( IllegalAccessException e ) {
						e.printStackTrace();
					} catch ( InvocationTargetException e ) {
						e.printStackTrace();
					} catch ( SecurityException e ) {
						e.printStackTrace();
					} catch ( NoSuchMethodException e ) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	/**
	 * 两对象之间的拷贝(在目标对象中存在的所有set方法，如果在源对象中存在对应的get方法，不管源对象的get方法的返回值是否为null,都进行拷贝)
	 * 仅拷贝方法名及方法返回类型完全一样的属性值
	 * 
	 * @param desc
	 *            目标对象
	 * @param orig
	 *            源对象
	 */
	public static void copyPropertiesNotForce( Object desc, Object orig ) {
		copyPropertiesNotForce( desc, orig, null );
	}

	/**
	 * 两对象之间的拷贝(在目标对象中存在的所有set方法，如果在源对象中存在对应的get方法，源对象的get方法的返回值为null的不拷贝)
	 * 仅拷贝方法名及方法返回类型完全一样的属性值
	 * 
	 * @param desc
	 *            目标对象
	 * @param orig
	 *            源对象
	 * @param excludeFields
	 *            不拷贝的field（多个用逗号隔开）
	 */
	public static void copyPropertiesNotNull( Object desc, Object orig ) {
		copyPropertiesNotForce( desc, orig, null, false );
	}

	public static void copyPropertiesNotNull( Object desc, Object orig, String excludeFields ) {
		copyPropertiesNotForce( desc, orig, excludeFields, false );
	}


	/**
	 * 通过字段名获取方法数组
	 * 
	 * @param beanClass
	 *            Class<?>
	 * @param fieldNameArray
	 *            要输出的所有字段名数组
	 * @return Method[]
	 */
	public static Method[] getMethods( Class<?> beanClass, String[] fieldNameArray ) {
		Method[] methodArray = new Method[ fieldNameArray.length ];

		String methodName;
		String fieldName;
		for ( int i = 0; i < fieldNameArray.length; i++ ) {
			Method method = null;
			fieldName = fieldNameArray[ i ];
			methodName = fieldName.substring( 0, 1 ).toUpperCase() + fieldName.substring( 1 );
			try {
				method = beanClass.getMethod( "get" + methodName, null );
			} catch ( SecurityException e ) {
				e.printStackTrace();
			} catch ( NoSuchMethodException e ) {
				try {
					method = beanClass.getMethod( "is" + methodName, null );
				} catch ( SecurityException e1 ) {
					e1.printStackTrace();
				} catch ( NoSuchMethodException e1 ) {
					e1.printStackTrace();
				}
			}
			methodArray[ i ] = method;
		}

		return methodArray;
	}

	private static <K, V> Map<K, V> bean2Map( Object javaBean ) {
		Map<K, V> ret = new HashMap<K, V>();
		try {
			Method[] methods = javaBean.getClass().getDeclaredMethods();
			for ( Method method : methods ) {
				if ( method.getName().startsWith( "get" ) ) {
					String field = method.getName();
					field = field.substring( field.indexOf( "get" ) + 3 );
					field = field.toLowerCase().charAt( 0 ) + field.substring( 1 );
					Object value = method.invoke( javaBean, ( Object[] ) null );
					ret.put( ( K ) field, ( V ) ( null == value ? "" : value ) );
				}
			}
		} catch ( Exception e ) {
		}
		return ret;
	}



	public static Map objectToMap( List fieldNameList, Object object ) {
		Map ret = new HashMap();
		for ( Iterator it = fieldNameList.iterator(); it.hasNext(); ) {
			String fieldName = ( String ) it.next();
			String[] fs = fieldName.split( quote( "." ) );
			try {
				Object o = object;
				for ( int i = 0; i < fs.length; ++i ) {
					Map objDesc = PropertyUtils.describe( o );
					o = objDesc.get( fs[ i ] );
					if ( o == null )
						break;
				}
				ret.put( fieldName, o );
			} catch ( Exception e ) {
				e.printStackTrace();
				// logger.error(e);
			}
		}
		return ret;
	}

	public static String quote( String s ) {
		int slashEIndex = s.indexOf( "\\E" );
		if ( slashEIndex == -1 )
			return "\\Q" + s + "\\E";

		StringBuffer sb = new StringBuffer( s.length() * 2 );
		sb.append( "\\Q" );
		slashEIndex = 0;
		int current = 0;
		while ( ( slashEIndex = s.indexOf( "\\E", current ) ) != -1 ) {
			sb.append( s.substring( current, slashEIndex ) );
			current = slashEIndex + 2;
			sb.append( "\\E\\\\E\\Q" );
		}
		sb.append( s.substring( current, s.length() ) );
		sb.append( "\\E" );
		return sb.toString();
	}
}