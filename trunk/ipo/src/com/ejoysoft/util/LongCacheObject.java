/**
 * $RCSfile: LongCacheObject.java,v $
 * $Revision: 1.1.1.1 $
 * $Date: 2002/09/09 13:51:12 $
 *
 * New Jive  from Jdon.com.
 *
 * This software is the proprietary information of CoolServlets, Inc.
 * Use is subject to license terms.
 */

package com.ejoysoft.util;


/**
 * Wrapper for all objects put into cache. It's primary purpose is to maintain
 * references to the linked lists that maintain the creation time of the object
 * and the ordering of the most used objects.
 *
 * This class is optimized for speed rather than strictly correct encapsulation.
 */
public final class LongCacheObject {

    /**
     * Underlying object wrapped by the CacheObject.
     */
    public Cacheable object;

    /**
     * The size of the Cacheable object. The size of the Cacheable
     * object is only computed once when it is added to the cache. This makes
     * the assumption that once objects are added to cache, they are mostly
     * read-only and that their size does not change significantly over time.
     */
    public long size;

    /**
     * A reference to the node in the cache order list. We keep the reference
     * here to avoid linear scans of the list. Every time the object is
     * accessed, the node is removed from its current spot in the list and
     * moved to the front.
     */
    public LongLinkedListNode lastAccessedListNode;

    /**
     * A reference to the node in the age order list. We keep the reference
     * here to avoid linear scans of the list. The reference is used if the
     * object has to be deleted from the list.
     */
    public LongLinkedListNode ageListNode;

    /**
     * Creates a new cache object wrapper. The size of the Cacheable object
     * must be passed in in order to prevent another possibly expensive
     * lookup by querying the object itself for its size.<p>
     *  java.lang.ref.ReferenceQueue queue=new  java.lang.ref.ReferenceQueue();
     * this.object = (Cacheable)new java.lang.ref.SoftReference(object,queue);
     * @param object the underlying Cacheable object to wrap.
     * @param size the size of the Cachable object in bytes.
     */
    public LongCacheObject(Cacheable object, long size) {
        this.object = object;
        this.size = size;
    }


}
