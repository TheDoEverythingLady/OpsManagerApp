import React, { useRef } from 'react';

export default function UploadCSVModal({ onUpload }) {
  const fileRef = useRef();

  const handleUpload = () => {
    const file = fileRef.current.files[0];
    const formData = new FormData();
    formData.append('file', file);
    onUpload(formData);
  };

  return (
    <div className="p-4 border rounded bg-white">
      <h2 className="text-lg font-bold mb-2">Upload CSV</h2>
      <input type="file" ref={fileRef} accept=".csv" className="mb-2" />
      <button onClick={handleUpload} className="bg-blue-500 text-white px-3 py-1 rounded">Upload</button>
    </div>
  );
}
