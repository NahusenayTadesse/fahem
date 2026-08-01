export interface GalleryImage {
	src: string;
	alt: string;
	caption?: string;
	/** Optional high-resolution source for the lightbox. Falls back to `src`. */
	full?: string;
}